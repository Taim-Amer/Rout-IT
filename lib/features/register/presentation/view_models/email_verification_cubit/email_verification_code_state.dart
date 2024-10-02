part of 'email_verification_code_cubit.dart';

class EmailVerificationCodeState extends Equatable {
  const EmailVerificationCodeState();

  @override
  List<Object> get props => [];
}

final class EmailVerificationCodeInitial extends EmailVerificationCodeState {}

final class EmailVerificationCodeLoading extends EmailVerificationCodeState {}

final class EmailVerificationCodeSucces extends EmailVerificationCodeState {
  final String succesMessage;
  const EmailVerificationCodeSucces({required this.succesMessage});
}

final class EmailVerificationCodeFailure extends EmailVerificationCodeState {
  final String failureMessage;

  const EmailVerificationCodeFailure({required this.failureMessage});
}
