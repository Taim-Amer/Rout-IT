part of 'article_sections_cubit.dart';

class ArticleSectionsState extends Equatable {
  const ArticleSectionsState();

  @override
  List<Object> get props => [];
}

class ArticleSectionsInitial extends ArticleSectionsState {}

class ArticleSectionsLoading extends ArticleSectionsState {}

class ArticleSectionsLoaded extends ArticleSectionsState {
  final List<ArticleSections> sections;

  const ArticleSectionsLoaded({required this.sections});
}

class ArticleSectionsFailure extends ArticleSectionsState {
  final String errMessage;

  const ArticleSectionsFailure({required this.errMessage});
}
