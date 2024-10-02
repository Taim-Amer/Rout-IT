part of 'road_map_ranking_cubit_cubit.dart';

class RoadMapRankingCubitState extends Equatable {
  const RoadMapRankingCubitState();

  @override
  List<Object> get props => [];
}

class RoadMapRankingCubitInitial extends RoadMapRankingCubitState {}

class RoadMapRankingCubitLoading extends RoadMapRankingCubitState {}

class RoadMapRankingCubitLoaded extends RoadMapRankingCubitState {
   final List<Ranking> topuser;

   const RoadMapRankingCubitLoaded({required this.topuser});
}

class RoadMapRankingCubitFailure extends RoadMapRankingCubitState {
  final String errMessage;

  const RoadMapRankingCubitFailure({required this.errMessage});
}
