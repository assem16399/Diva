import 'package:diva/features/login/ui/widgets/dont_have_account.dart';
import 'package:diva/features/login/ui/widgets/email_and_password.dart';
import 'package:diva/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/themes/text_styles.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
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
                    SizedBox(
                      height: 300,
                      width: 230,
                      child: Image.asset("assets/Tablet login-pana 1.png"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        const EmailAndPassword(),
                        verticalSpace(30),
                        const DontHaveAccount(),
                        const LoginBlocListener(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
