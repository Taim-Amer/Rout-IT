import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/home/data/models/technology_category_model.dart';
import 'package:route_it27/features/home/data/repo/home_repo.dart';

part 'technology_categories_state.dart';

class TechnologyCategoriesCubit extends Cubit<TechnologyCategoriesState> {
  TechnologyCategoriesCubit({required this.technologyCategoriesRepo})
      : super(TechnologyCategoriesInitial());

  HomeRepo technologyCategoriesRepo;

  Future<void> fetchAllCategories() async {
    emit(TechnologyCategoriesLoading());
    var response = await technologyCategoriesRepo.fetchAllCategories();

    response.fold(
        (failure) =>
            emit(TechnologyCategoriesFailure(errMessage: failure.errMessage)),
        (success) =>
            emit(TechnologyCategoriesLoaded(technologyCategories: success)));
  }
}
