import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/competition/data/models/winners_model.dart';
import 'package:route_it27/features/competition/data/repos/competition_repo.dart';

part 'winners_state.dart';

class WinnersCubit extends Cubit<WinnersState> {
  WinnersCubit(this.competitionRepo) : super(WinnersInitial());
  final CompetitionRepo competitionRepo;
  Future<void> fetchAllWiners({required int competitionId}) async {
    emit(WinnersLoading());
    final response =
        await competitionRepo.fetchAllWinners(competitionId: competitionId);
    response.fold((fail) => emit(WinnersFailure(errMessage: fail.errMessage)),
        (success) => emit(WinnersLoaded(winnersModel: success)));
  }
}
