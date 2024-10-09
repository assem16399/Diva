import 'package:bloc/bloc.dart';
import 'package:diva/features/signup/data/models/signup_request_body.dart';
import 'package:diva/features/signup/data/models/signup_response.dart';
import 'package:diva/features/signup/data/repos/signup_repos.dart';
import 'package:diva/features/signup/logic/signup_state.dart';

class SignupCubit extends Cubit<SignupState<SignupResponse>> {
  SignupCubit(this._repo) : super(const SignupState.initial());

  final SignupRepo _repo;

  Future<void> emitSignupStates(SignupRequestBody signupRequestBody) async {
    emit(const SignupState.signupLoading());
    final response = await _repo.signup(signupRequestBody);
    response.when(
      success: (signupResponse) => emit(
        SignupState.signupSuccess(signupResponse),
      ),
      failure: (error) => emit(
        SignupState.signupError(error: error.message ?? ''),
      ),
    );
  }
}
