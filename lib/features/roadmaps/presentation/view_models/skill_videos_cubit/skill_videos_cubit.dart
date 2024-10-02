import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/roadmaps/data/models/skill_videos_model.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo.dart';

part 'skill_videos_state.dart';

class SkillVideosCubit extends Cubit<SkillVideosState> {
  SkillVideosCubit({required this.roadMapRepo}) : super(SkillVideosInitial());
  final RoadMapRepo roadMapRepo;

  Future<void> fetchSkillVideos({required int roadMapSkillId}) async {
    emit(SkillVideosLoading());
    var finalResponse =
        await roadMapRepo.fetchSkillVideos(roadMapSkillId: roadMapSkillId);

    finalResponse.fold((failure) {
      emit(SkillVideosFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(SkillVideosLoaded(videos: success.skillsVideos!));
    });
  }
}
