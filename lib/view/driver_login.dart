import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_ride/components/common/common_appbar.dart';
import 'package:rent_a_ride/components/common/common_button.dart';
import 'package:rent_a_ride/components/common/common_textfield.dart';
import 'package:rent_a_ride/utils/colors.dart';
import 'package:rent_a_ride/utils/space.dart';
import 'package:rent_a_ride/view/driver_signup.dart';
import 'package:rent_a_ride/view_model/driver_view_model.dart';



class DriverLogin extends StatelessWidget {
   DriverLogin({super.key});
  final _driverformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<DriverViewModel>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CommonAppbar(
          title: "Welcome Back!",
          widget: TextButton(
            onPressed: () {
                provider.clearController();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DriverSignup();
                  },
                ),
              );
            },
            child: const Text("Don't have any account.? "),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode curentFocus = FocusScope.of(context);
          if (!curentFocus.hasPrimaryFocus) {
            curentFocus.unfocus();
          }
        },
        child: Form(
          key: _driverformkey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              children: [
                const SpaceWH(height: 20),
                CommonTextField(
                  isEmail: true,
                  prefixIcon: const Icon(Icons.email),
                  controller: provider.loginEmailcntrlr,
                  hintText: "Email",
                  keyType: TextInputType.emailAddress,
                  size: size,
                ),
                const SpaceWH(height: 20),
                CommonTextField(
                  isObs: true,
                  isPassword: true,
                  prefixIcon: const Icon(Icons.key),
                  controller: provider.loginPswrdcntrlr,
                  hintText: "Password",
                  keyType: TextInputType.text,
                  size: size,
                ),
                const SpaceWH(height: 30),
                provider.isLoading
                    ? CommonButton(
                        onTap: () {},
                        color: kBlack,
                        child: const Text("LOADING..."),
                      )
                    : CommonButton(
                        color: blueButton,
                        child: const Text(
                          "Login",
                        ),
                        onTap: () {
                          if (_driverformkey.currentState!.validate()) {
                            provider.driverLoginService(context);
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
