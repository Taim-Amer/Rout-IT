import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/roadmaps/data/models/roadmap_skills_model.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo.dart';

part 'road_map_skills_state.dart';

class RoadMapSkillsCubit extends Cubit<RoadMapSkillsState> {
  RoadMapSkillsCubit({required this.roadMapRepo})
      : super(RoadMapSkillsInitial());
  final RoadMapRepo roadMapRepo;

  Future<void> fetchRoadMapSkills({required int roadmapId}) async {
    emit(RoadMapSkillsLoading());
    var finalResponse =
        await roadMapRepo.fetchRoadMapSkills(roadMapId: roadmapId);

    finalResponse.fold(
        (failure) => emit(RoadMapSkillsFailure(errMessage: failure.errMessage)),
        (success) => emit(RoadMapSkillsLoaded(skills: success)));
  }
}
