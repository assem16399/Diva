import 'package:bloc/bloc.dart';
import 'package:diva/core/networking/api_error_model.dart';
import 'package:diva/core/networking/api_error_model.dart';
import 'package:diva/core/networking/api_error_model.dart';
import 'package:diva/features/login/data/models/login_request_body.dart';
import 'package:diva/features/login/data/repo/login_repo.dart';
import 'package:diva/features/login/logic/login_state.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/networking/api_error_model.dart';
import '../../../core/networking/dio_factory.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) async {
      await saveUserToken(loginResponse.userData?.token ?? '');
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.ApiErrorModel.message ?? ''));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
