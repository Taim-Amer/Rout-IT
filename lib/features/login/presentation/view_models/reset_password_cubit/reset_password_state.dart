// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final String message;
  const ResetPasswordSuccess({
    required this.message,
  });
}

class ResetPasswordFailure extends ResetPasswordState {
  final String message;
  const ResetPasswordFailure({
    required this.message,
  });
}
