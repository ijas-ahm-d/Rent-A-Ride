import 'package:flutter/material.dart';
import 'package:rent_a_ride/components/common_snackbar.dart';
import 'package:rent_a_ride/models/user_login_model.dart';
import 'package:rent_a_ride/repo/api_services.dart';
import 'package:rent_a_ride/repo/api_status.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/url.dart';
import 'package:rent_a_ride/view/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginViewModel with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserLoginModel? _userData;
  UserLoginModel get userData => _userData!;

  LoginError? _loginError;
  LoginError get loginError => _loginError!;

// Function for password visibility
  showPassword() {
    _passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  // Function to know it is loading
  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  Future<UserLoginModel?> setUserData(UserLoginModel userData) async {
    _userData = userData;
    return _userData;
  }

  //
  setLoginError(LoginError loginError, context) async {
    _loginError = loginError;
    return errorResponses(_loginError!, context);
  }

  // Main function in user Login
  getLoginStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    String url = Urls.baseUrl + Urls.user + Urls.userLogIn;
    final response = await ApiServices.postMethod(
      url,
      userDataBody(),
      context,
      userLoginModelFromJson,
    );

    if (response is Success) {
      final data = await setUserData(response.response as UserLoginModel);
      final accessToken = data!.token;
      clearController();
      setLoginStatus(accessToken!);
      navigator.pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) {
          return  HomeScreen();
        },
      ), (route) => false);
    }

    if (response is Failures) {
      await setLoading(false);
      LoginError loginError = LoginError(
        code: response.code,
        message: response.errrorResponse,
      );
      await setLoginError(loginError, context);
    }
    setLoading(false);
  }

  clearController() {
    passwordController.clear();
    emailController.clear();
  }

  // save the value of access token and make sure the user already login or not
  setLoginStatus(String accessToken) async {
    final status = await SharedPreferences.getInstance();
    await status.setBool("isLoggedIn", true);
    await status.setString("ACCESS_TOKEN", accessToken);
  }

  // The body to pass in the method
  Map<String, dynamic> userDataBody() {
    final body = UserLoginModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    return body.toJson();
  }

  errorResponses(LoginError loginError, BuildContext context) {
    final statusCode = loginError.code;
    if (statusCode == 401 || statusCode == 500) {
      return CommonSnackBAr().snackBar(
          context: context,
          data: "Invalid Username or password",
          color: snackbarRed);
    }
    return CommonSnackBAr().snackBar(
        context: context, data: "No internet connection", color: snackbarRed);
  }
}

class LoginError {
  int? code;
  Object? message;

  LoginError({
    this.code,
    this.message,
  });
}
