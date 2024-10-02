part of 'road_maps_cubit.dart';

class RoadMapsState extends Equatable {
  const RoadMapsState();

  @override
  List<Object> get props => [];
}

final class RoadMapsInitial extends RoadMapsState {}

final class RoadMapsLoading extends RoadMapsState {}

final class RoadMapsLoaded extends RoadMapsState {
  final List<RoadMapModel> roadmaps;

  const RoadMapsLoaded({required this.roadmaps});
}

final class RoadMapsFailure extends RoadMapsState {
  final String errMessage;

  const RoadMapsFailure({required this.errMessage});
}
