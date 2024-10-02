part of 'road_map_skills_cubit.dart';

class RoadMapSkillsState extends Equatable {
  const RoadMapSkillsState();

  @override
  List<Object> get props => [];
}

class RoadMapSkillsInitial extends RoadMapSkillsState {}

class RoadMapSkillsLoading extends RoadMapSkillsState {}

class RoadMapSkillsLoaded extends RoadMapSkillsState {
  final List<RoadMapSkillsModel> skills;

  const RoadMapSkillsLoaded({required this.skills});
}

class RoadMapSkillsFailure extends RoadMapSkillsState {
  final String errMessage;

  const RoadMapSkillsFailure({required this.errMessage});
}
