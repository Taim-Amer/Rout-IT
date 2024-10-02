import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/competition/data/models/competitor_models.dart';
import 'package:route_it27/features/competition/data/repos/competition_repo.dart';

part 'competitor_state.dart';

class CompetitorCubit extends Cubit<CompetitorState> {
  CompetitorCubit(this.competitionRepo) : super(CompetitorInitial());

  final CompetitionRepo competitionRepo;

  Future<void> fetchAllCompetitors({required int competionId}) async {
    emit(CompetitorLoading());

    final response =
        await competitionRepo.fetchAllCompetitors(competitionId: competionId);

    response.fold((failure) => emit(CompetitorFailure(errMessage: failure.errMessage)),
        (success) => emit(CompetitorLoaded(competitor: success)));
  }
}
