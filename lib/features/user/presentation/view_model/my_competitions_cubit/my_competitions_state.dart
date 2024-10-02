part of 'my_competitions_cubit.dart';

class MyCompetitionsState extends Equatable {
  const MyCompetitionsState();

  @override
  List<Object> get props => [];
}

class MyCompetitionsInitial extends MyCompetitionsState {}

class MyCompetitionsLoaded extends MyCompetitionsState {
  final MyCompetitionModel myCompetitionModel;

  const MyCompetitionsLoaded({required this.myCompetitionModel});
}

class MyCompetitionsLoading extends MyCompetitionsState {}

class MyCompetitionsFailure extends MyCompetitionsState {
  final String errMessage;

  const MyCompetitionsFailure({required this.errMessage});
}
