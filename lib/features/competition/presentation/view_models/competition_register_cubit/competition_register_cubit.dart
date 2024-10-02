import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/competition/data/models/register_competition.dart';
import 'package:route_it27/features/competition/data/repos/competition_repo.dart';
part 'competition_register_state.dart';

class CompetitionRegisterCubit extends Cubit<CompetitionRegisterState> {
  CompetitionRegisterCubit(this.competitionRepo)
      : super(CompetitionRegisterInitial());
  final CompetitionRepo competitionRepo;
  Future<void> registerCompettion({required int competitionId}) async {
    emit(CompetitionRegisterLoading());
    final response =
        await competitionRepo.registerCompetition(competitionId: competitionId);
    response.fold((failure) {
      // ignore: avoid_print
      print("we got an error in compettiton register${failure.errMessage}");
      return emit(CompetitionRegisterFailure(errMessage: failure.errMessage));
    }, (success) {
      // ignore: avoid_print
      print("  we got succsfuly compettiton register${success.message}");
      emit(CompetitionRegisterLoaded(registerCompetition: success));
    });
  }
}
