part of 'skill_videos_cubit.dart';

class SkillVideosState extends Equatable {
  const SkillVideosState();

  @override
  List<Object> get props => [];
}

class SkillVideosInitial extends SkillVideosState {}

class SkillVideosLoading extends SkillVideosState {}

class SkillVideosLoaded extends SkillVideosState {
  final List<SkillsVideos> videos;

  const SkillVideosLoaded({required this.videos});
}

class SkillVideosFailure extends SkillVideosState {
  final String errMessage;

  const SkillVideosFailure({required this.errMessage});
}
