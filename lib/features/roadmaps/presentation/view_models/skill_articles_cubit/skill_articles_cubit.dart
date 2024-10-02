import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/roadmaps/data/models/skills_articles_model.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo.dart';
part 'skill_articles_state.dart';

class SkillArticlesCubit extends Cubit<SkillArticlesState> {
  SkillArticlesCubit({required this.roadMapRepo})
      : super(SkillArticlesInitial());
  final RoadMapRepo roadMapRepo;

  Future<void> fetchSkillArticles({required int skillId}) async {
    var finalREsponse =
        await roadMapRepo.fetchSkillArticles(roadMapSkillId: skillId);
    finalREsponse.fold(
      (failure) => emit(SkillArticlesFailure(errMessage: failure.errMessage)),
      (success) => emit(SkillArticlesLoaded(articles: success.skillsArticles!)),
    );
  }
}
