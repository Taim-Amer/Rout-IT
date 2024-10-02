part of 'search_roadmap_cubit.dart';

class SearchRoadmapState extends Equatable {
  const SearchRoadmapState();

  @override
  List<Object> get props => [];
}

class SearchRoadmapInitial extends SearchRoadmapState {}

class SearchRoadmapLoading extends SearchRoadmapState {}

class SearchRoadmapLoaded extends SearchRoadmapState {
  final RoadMapSearchModel roadmapSearchModel;

  const SearchRoadmapLoaded({required this.roadmapSearchModel});
}

class SearchRoadmapFailure extends SearchRoadmapState {
  final String errMessage;

  const SearchRoadmapFailure({required this.errMessage});
}
