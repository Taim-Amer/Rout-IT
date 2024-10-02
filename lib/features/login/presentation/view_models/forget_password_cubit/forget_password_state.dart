part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String succesMessage;
  const ForgetPasswordSuccess({required this.succesMessage});
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String failureMessage;

  const ForgetPasswordFailure({required this.failureMessage});
}
