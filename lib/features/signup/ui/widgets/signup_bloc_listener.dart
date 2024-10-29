import 'package:diva/core/helpers/extensions.dart';
import 'package:diva/core/routing/routes.dart';
import 'package:diva/core/themes/colors.dart';
import 'package:diva/core/widgets/error_dialog.dart';
import 'package:diva/core/widgets/success_dialog.dart';
import 'package:diva/features/signup/data/models/signup_response.dart';
import 'package:diva/features/signup/logic/signup_cubit.dart';
import 'package:diva/features/signup/logic/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState<SignupResponse>>(
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            showDialog<dynamic>(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainDeepPink,
                ),
              ),
            );
          },
          signupSuccess: (signupResponse) {
            context.pop();
            _showSuccessDialog(context);
          },
          signupError: (error) {
            _setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return SuccessDialog(
          title: 'Signup Successful',
          content: 'Congratulations, you have signed up successfully!',
          onActionPressed: () {
            context.pushNamed(Routes.loginScreen);
          },
        );
      },
    );
  }

  void _setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog<dynamic>(
      context: context,
      builder: (context) => ErrorDialog(
        errorMsg: error,
      ),
    );
  }
}
