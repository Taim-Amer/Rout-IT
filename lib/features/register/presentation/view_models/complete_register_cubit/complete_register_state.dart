part of 'complete_register_cubit.dart';

class CompleteRegisterState extends Equatable {
  const CompleteRegisterState();

  @override
  List<Object> get props => [];
}

 class CompleteRegisterInitial extends CompleteRegisterState {}

 class CompleteRegisterLoading extends CompleteRegisterState {}

 class CompleteRegisterSucces extends CompleteRegisterState {
  final String succesMessage;

  const CompleteRegisterSucces({required this.succesMessage});
}
 class CompleteRegisterFailure extends CompleteRegisterState {
  final String failureMessage;

  const CompleteRegisterFailure({required this.failureMessage});
}
