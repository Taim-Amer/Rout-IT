part of 'reset_password_code_cubit.dart';

sealed class ResetPasswordCodeState extends Equatable {
  const ResetPasswordCodeState();

  @override
  List<Object> get props => [];
}

class ResetPasswordCodeInitial extends ResetPasswordCodeState {}

class ResetPasswordCodeLoading extends ResetPasswordCodeState {}

class ResetPasswordCodeSuccess extends ResetPasswordCodeState {
  final String message;

  const ResetPasswordCodeSuccess({required this.message});
}

class ResetPasswordCodeFailure extends ResetPasswordCodeState {
  final String message;

  const ResetPasswordCodeFailure({required this.message});

}
