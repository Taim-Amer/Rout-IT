import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/competition/data/models/add_project_link_model.dart';
import 'package:route_it27/features/competition/data/repos/competition_repo.dart';

part 'add_project_link_state.dart';

class AddProjectLinkCubit extends Cubit<AddProjectLinkState> {
  AddProjectLinkCubit(this.competitionRepo) : super(AddProjectLinkInitial());
  final CompetitionRepo competitionRepo;

  Future<void> addProjectLink(
      {required int competitionId, required String projectLink}) async {
    emit(AddProjectLinkLoading());
    var response = await competitionRepo.addProjectLink(
        competitionId: competitionId, projectLink: projectLink);
    response.fold((failure) {
      // ignore: avoid_print
      print("error in adding project link");
      emit(AddProjectLinkFailure(errMessage: failure.errMessage));
    }, (success) {
      // ignore: avoid_print
      print("we add the project link succsfuly");
      emit(AddProjectLinkSuccess(projectLinkModel: success));
    });
  }
}
