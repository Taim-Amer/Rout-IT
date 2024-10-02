import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/search/data/models/road_map_search_model.dart';
import 'package:route_it27/features/search/data/repos/search_repo.dart';

part 'search_roadmap_state.dart';

class SearchRoadmapCubit extends Cubit<SearchRoadmapState> {
  SearchRoadmapCubit(this.searchRepo) : super(SearchRoadmapInitial());
  final SearchRepo searchRepo;

  Future<void> searchRoadMap({required String roadMap}) async {
    emit(SearchRoadmapLoading());
    var response = await searchRepo.roadMapSearch(roadMap: roadMap);
    response.fold(
        (faliure) => emit(SearchRoadmapFailure(errMessage: faliure.errMessage)),
        (success) => emit(SearchRoadmapLoaded(roadmapSearchModel: success)));
  }
}
