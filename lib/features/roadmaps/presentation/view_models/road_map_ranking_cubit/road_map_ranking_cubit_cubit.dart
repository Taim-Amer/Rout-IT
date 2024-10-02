// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/roadmaps/data/models/road_map_ranking.dart';

import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo.dart';

part 'road_map_ranking_cubit_state.dart';

class RoadMapRankingCubitCubit extends Cubit<RoadMapRankingCubitState> {
  RoadMapRankingCubitCubit(this.roadMapRepo)
      : super(RoadMapRankingCubitInitial());
  final RoadMapRepo roadMapRepo;
  Future<void> roadMapRanking({required int roadMapId}) async {
    emit(RoadMapRankingCubitLoading());

    var finalResponse = await roadMapRepo.roadMapRanking(roadMapId: roadMapId);
    finalResponse.fold(
      (failure) {
        print("we got an error in the ranking  section");
        emit(RoadMapRankingCubitFailure(errMessage: failure.errMessage));
      },
      (success) {
        print("we got the ranking top users");
         emit(RoadMapRankingCubitLoaded(topuser: success));
      },
    );
  }
}
