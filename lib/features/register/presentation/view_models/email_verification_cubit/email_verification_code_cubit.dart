import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/register/data/repo/register_repo.dart';

part 'email_verification_code_state.dart';

class EmailVerificationCodeCubit extends Cubit<EmailVerificationCodeState> {
  EmailVerificationCodeCubit({required this.registerRepo})
      : super(EmailVerificationCodeInitial());

  final RegisterRepo registerRepo;

  Future<void> checkEmailVerificationCode({required int code}) async {
    emit(EmailVerificationCodeLoading());
    var finalResponse =
        await registerRepo.checkEmailVerificationCode(verificationCode: code);
    finalResponse.fold(
        (failure) => emit(
            EmailVerificationCodeFailure(failureMessage: failure.errMessage)),
        (succes) =>
            emit(EmailVerificationCodeSucces(succesMessage: succes.message!)));
  }
}
