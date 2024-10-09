import 'package:diva/core/widgets/my_Text_Feild.dart';
import 'package:diva/features/login/ui/widgets/dont_Have_Account.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/themes/styles.dart';
import '../../../core/widgets/my_Text_Button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome back',
                    style: TextStyles.font28BlackMedium,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 300,
                  width: 230,
                  child: Image.asset("assets/Tablet login-pana 1.png"),
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    Mytextfeild(
                        hintText: " E-mail / phone number",
                        obscureText: false,
                        Controller: emailcontroller),
                    const SizedBox(
                      height: 15,
                    ),
                    Mytextfeild(
                        hintText: "password",
                        obscureText: false,
                        Controller: passwordcontroller),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 17, top: 10),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font14PinkRegular,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(30),
                MyTextButtom(
                  buttonText: "Login",
                  textStyle: TextStyles.font20whiteRegular,
                  onPressed: () {},
                ),
                verticalSpace(60),
                const dontHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
