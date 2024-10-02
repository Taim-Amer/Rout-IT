part of 'competitor_cubit.dart';

class CompetitorState extends Equatable {
  const CompetitorState();

  @override
  List<Object> get props => [];
}

class CompetitorInitial extends CompetitorState {}

class CompetitorLoading extends CompetitorState {}

class CompetitorLoaded extends CompetitorState {
  final List<Competitor> competitor;

  const CompetitorLoaded({required this.competitor});
}

class CompetitorFailure extends CompetitorState {
  final String errMessage;

  const CompetitorFailure({required this.errMessage});
}
