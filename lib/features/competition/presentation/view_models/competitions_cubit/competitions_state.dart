part of 'competitions_cubit.dart';

class CompetitionsState extends Equatable {
  const CompetitionsState();

  @override
  List<Object> get props => [];
}

class CompetitionsInitial extends CompetitionsState {}

class CompetitionsLoading extends CompetitionsState {}

class CompetitionsLoaded extends CompetitionsState {
  final List<Competitions> competitions;

  const CompetitionsLoaded(this.competitions);
}

class CompetitionsFailure extends CompetitionsState {
  final String errMessage;

  const CompetitionsFailure(this.errMessage);
}
