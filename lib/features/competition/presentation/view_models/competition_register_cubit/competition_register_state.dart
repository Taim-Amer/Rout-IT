part of 'competition_register_cubit.dart';

class CompetitionRegisterState extends Equatable {
  const CompetitionRegisterState();

  @override
  List<Object> get props => [];
}

class CompetitionRegisterInitial extends CompetitionRegisterState {}

class CompetitionRegisterLoading extends CompetitionRegisterState {}

class CompetitionRegisterLoaded extends CompetitionRegisterState {
  final RegisterCompetition registerCompetition;

  const CompetitionRegisterLoaded({required this.registerCompetition});
}

class CompetitionRegisterFailure extends CompetitionRegisterState {
  final String errMessage;

  const CompetitionRegisterFailure({required this.errMessage});
}
