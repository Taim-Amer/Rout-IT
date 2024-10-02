part of 'technology_categories_cubit.dart';

class TechnologyCategoriesState extends Equatable {
  const TechnologyCategoriesState();

  @override
  List<Object> get props => [];
}

class TechnologyCategoriesInitial extends TechnologyCategoriesState {}

class TechnologyCategoriesLoading extends TechnologyCategoriesState {}

class TechnologyCategoriesLoaded extends TechnologyCategoriesState {
  final List<TechnologyCategoryModel> technologyCategories;

  const TechnologyCategoriesLoaded({required this.technologyCategories});
}

class TechnologyCategoriesFailure extends TechnologyCategoriesState {
  final String errMessage;

  const TechnologyCategoriesFailure({required this.errMessage});
}
