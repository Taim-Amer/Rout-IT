part of 'followed_experts_cubit.dart';

@immutable
abstract class FollowedExpertsState {}

class FollowedExpertsInitial extends FollowedExpertsState {}

class FollowedExpertsLoading extends FollowedExpertsState {}

class FollowedExpertsSuccess extends FollowedExpertsState {
  final FollowedExpertsModel info;
  FollowedExpertsSuccess(this.info);
}

class FollowedExpertsFailure extends FollowedExpertsState {
  final String errMessage;
  FollowedExpertsFailure(this.errMessage);
}
