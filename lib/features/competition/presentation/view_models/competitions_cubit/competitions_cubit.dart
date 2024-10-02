import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/competition/data/models/competition_model.dart';
import 'package:route_it27/features/competition/data/repos/competition_repo.dart';

part 'competitions_state.dart';

class CompetitionsCubit extends Cubit<CompetitionsState> {
  CompetitionsCubit(this.competitionRepo) : super(CompetitionsInitial());
  final CompetitionRepo competitionRepo;
  Future<void> fetchCompetitions(String competitionsState) async {
    emit(CompetitionsLoading());
    final response = await competitionRepo.fetchCompetitions(
        competitionState: competitionsState);

    response.fold((failure) => emit(CompetitionsFailure(failure.errMessage)),
        (success) => emit(CompetitionsLoaded(success)));
  }
}
