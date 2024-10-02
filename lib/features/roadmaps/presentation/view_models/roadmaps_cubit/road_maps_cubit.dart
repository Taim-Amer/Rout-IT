import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo.dart';

part 'road_maps_state.dart';

class RoadMapsCubit extends Cubit<RoadMapsState> {
  RoadMapsCubit({required this.roadMapRepo}) : super(RoadMapsInitial());

  final RoadMapRepo roadMapRepo;

  Future<void> fetchRoadMaps({required int technologyLevelId}) async {
    emit(RoadMapsLoading());

    var response =
        await roadMapRepo.fetchRoadMaps(technologyLlevelId: technologyLevelId);

    await Future.delayed(const Duration(milliseconds: 1000));

    response.fold(
        (failure) => emit(RoadMapsFailure(errMessage: failure.errMessage)),
        (success) => emit(RoadMapsLoaded(roadmaps: success)));
  }
}
