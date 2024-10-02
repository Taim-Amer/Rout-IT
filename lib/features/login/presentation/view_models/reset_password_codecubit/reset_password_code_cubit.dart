import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/login/data/repos/login_repo.dart';

part 'reset_password_code_state.dart';

class ResetPasswordCodeCubit extends Cubit<ResetPasswordCodeState> {
  ResetPasswordCodeCubit({required this.loginRepo})
      : super(ResetPasswordCodeInitial());
  final LoginRepo loginRepo;

  Future<void> resetPasswordCode(
      {required String email, required int otbCode}) async {
    emit(ResetPasswordCodeLoading());
    var finalResponse =
        await loginRepo.resetPasswordCode(email: email, otbCode: otbCode);

    finalResponse.fold(
        (failure) =>
            emit(ResetPasswordCodeFailure(message: failure.errMessage)),
        (success) => emit(ResetPasswordCodeSuccess(message: success.message!)));
  }
}
