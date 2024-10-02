// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'save_test_result_cubit.dart';

class SaveTestResultState extends Equatable {
  const SaveTestResultState();

  @override
  List<Object> get props => [];
}

class SaveTestResultInitial extends SaveTestResultState {}

class SaveTestResultLoading extends SaveTestResultState {}

class SaveTestResultSuccess extends SaveTestResultState {
  final String successMessage;
  const SaveTestResultSuccess({
    required this.successMessage,
  });
}

class SaveTestResultFailure extends SaveTestResultState {
  final String errMessage;
  const SaveTestResultFailure({
    required this.errMessage,
  });
}
