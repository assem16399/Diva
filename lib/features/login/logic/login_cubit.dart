import 'package:bloc/bloc.dart';
import 'package:diva/core/helpers/constants.dart';
import 'package:diva/core/helpers/shared_pref_helper.dart';
import 'package:diva/features/login/data/models/login_request_body.dart';
import 'package:diva/features/login/data/models/login_response.dart';
import 'package:diva/features/login/data/repo/login_repo.dart';
import 'package:diva/features/login/logic/login_state.dart';
import 'package:flutter/cupertino.dart';

class LoginCubit extends Cubit<LoginState<LoginResponse>> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final LoginRepo _loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitLoginStates() async {
    if (!formKey.currentState!.validate()) return;
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    await response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.token ?? '');
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.message ?? ''));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  }
}
