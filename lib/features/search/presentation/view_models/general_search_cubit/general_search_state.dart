part of 'general_search_cubit.dart';

class GeneralSearchState extends Equatable {
  const GeneralSearchState();

  @override
  List<Object> get props => [];
}

class GeneralSearchInitial extends GeneralSearchState {}

class GeneralSearchLoading extends GeneralSearchState {}

class GeneralSearchLoaded extends GeneralSearchState {
  final GeneralSearchModel generalSearchModel;

  const GeneralSearchLoaded({required this.generalSearchModel});
}

class GeneralSearchFailure extends GeneralSearchState {
  final String errMessage;

  const GeneralSearchFailure({required this.errMessage});
}
