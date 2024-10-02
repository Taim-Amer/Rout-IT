part of 'skill_articles_cubit.dart';

class SkillArticlesState extends Equatable {
  const SkillArticlesState();

  @override
  List<Object> get props => [];
}

class SkillArticlesInitial extends SkillArticlesState {}

class SkillArticlesLoading extends SkillArticlesState {}

class SkillArticlesLoaded extends SkillArticlesState {
  final List<SkillsArticles> articles;

  const SkillArticlesLoaded({required this.articles});
}

class SkillArticlesFailure extends SkillArticlesState {
  final String errMessage;

  const SkillArticlesFailure({required this.errMessage});
}
