import 'package:flutter/material.dart';
import 'package:rent_a_ride/components/common/common_snackbar.dart';
import 'package:rent_a_ride/data/response/api_response.dart';
import 'package:rent_a_ride/data/response/staus.dart';
import 'package:rent_a_ride/models/user_login_model.dart';
import 'package:rent_a_ride/repository/user_auth/user_login_repository.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/constant.dart';
import 'package:rent_a_ride/utils/global_keys.dart';
import 'package:rent_a_ride/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginViewModel with ChangeNotifier {
  UserLoginViewModel() {
    checkSign();
    getUserDetails();
  }

  final _myRepo = UserLoginRepository();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  bool _passwordVisibility = true;
  bool get passwordVisibility => _passwordVisibility;

  String? _userName;
  String? get userName => _userName;

  String? _userEmail;
  String? get userEmail => _userEmail;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  getUserName(String? usrName) {
    _userName = usrName;
    notifyListeners();
  }

  getUserEmail(String? usrEmail) {
    _userEmail = usrEmail;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  void checkSign() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isLoggedIn = s.getBool(GlobalKeys.userLoggedIn) ?? false;
    notifyListeners();
  }

  getLoginStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    String url = Urls.baseUrl + Urls.user + Urls.userLogIn;
    _myRepo
        .getUserLogin(url: url, body: userDataBody())
        .then(
          (value) => {
            setLoginResponse(
              ApiResponse.completed(value),
              context,
            ),
            clearController(),
            navigator.pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ),
            ),
          },
        )
        .onError(
          (error, stackTrace) => {
            setLoginResponse(
              ApiResponse.error(error.toString()),
              context,
            ),
            clearPswrd(),
          },
        );
    setLoading(false);
  }

  clearPswrd() {
    passwordController.clear();
  }

  clearController() {
    passwordController.clear();
    emailController.clear();
  }

  showPassword() {
    _passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  Map<String, dynamic> userDataBody() {
    final body = UserLoginModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    return body.toJson();
  }

  setLoginResponse(ApiResponse<UserLoginModel> response, BuildContext context) {
    if (response.status == Status.completed) {
      final data = response.data;
      setLoginStatus(data!.token!, data.fullName!, data.email!, data.sId!);
    } else if (response.status == Status.error) {
      CommonSnackBAr.snackBar(
        context: context,
        data: response.message.toString(),
        color: snackbarwarn,
      );
    }
  }

  setLoginStatus(String aTkn, String uName, String uEmail, String uId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(GlobalKeys.userLoggedIn, true);
    prefs.setString(GlobalKeys.accessToken, aTkn);
    prefs.setString(GlobalKeys.userName, uName);
    prefs.setString(GlobalKeys.userEmail, uEmail);
    prefs.setString(GlobalKeys.userId, uId);
  }

  getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(GlobalKeys.userName);
    final email = prefs.getString(GlobalKeys.userEmail);
    getUserName(name);
    getUserEmail(email);
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
