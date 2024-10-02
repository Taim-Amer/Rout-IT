import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/login/data/repos/login_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.loginRepo}) : super(ResetPasswordInitial());

  final LoginRepo loginRepo;

  Future<void> resetPassword(
      {required String email,
      required String password,
      required String passwordConfirmation}) async {
    var finalResponse = await loginRepo.resetPassword(
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation);

    finalResponse.fold(
        (failure) => emit(ResetPasswordFailure(message: failure.errMessage)),
        (success) => emit(ResetPasswordSuccess(message: success.message!)));
  }
}
