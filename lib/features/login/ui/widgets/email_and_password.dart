import 'package:diva/core/helpers/app_regex.dart';
import 'package:diva/core/helpers/spacing.dart';
import 'package:diva/core/themes/styles.dart';
import 'package:diva/core/widgets/app_text_form_field.dart';
import 'package:diva/core/widgets/my_text_button.dart';
import 'package:diva/core/widgets/obscured_text_form_field.dart';
import 'package:diva/features/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  void _loginPressed(BuildContext context) {
    context.read<LoginCubit>().emitLoginStates();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: 'E-mail',
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(16),
          ObscuredTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
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
          verticalSpace(30),
          MyTextButtom(
            buttonText: 'Login',
            textStyle: TextStyles.font20whiteRegular,
            onPressed: () => _loginPressed(context),
          ),
        ],
      ),
    );
  }
}
