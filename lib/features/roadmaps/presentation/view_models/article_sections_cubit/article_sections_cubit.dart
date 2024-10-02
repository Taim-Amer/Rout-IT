import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/roadmaps/data/models/article_sections_model.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo.dart';

part 'article_sections_state.dart';

class ArticleSectionsCubit extends Cubit<ArticleSectionsState> {
  ArticleSectionsCubit({required this.roadMapRepo})
      : super(ArticleSectionsInitial());
  final RoadMapRepo roadMapRepo;

  Future<void> fetchArticleSections({required int articleId}) async {
    var finalREsponse =
        await roadMapRepo.fetchArticleSections(articleId: articleId);
    finalREsponse.fold(
      (failure) => emit(ArticleSectionsFailure(errMessage: failure.errMessage)),
      (success) =>
          emit(ArticleSectionsLoaded(sections: success.articleSections!)),
    );
  }
}
