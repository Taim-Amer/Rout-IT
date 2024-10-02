part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSucces extends RegisterState {
  final RegisterModel response;

  const RegisterSucces({required this.response});
}

final class RegisterFailure extends RegisterState {
  final String errMessage;

  const RegisterFailure({required this.errMessage});
}