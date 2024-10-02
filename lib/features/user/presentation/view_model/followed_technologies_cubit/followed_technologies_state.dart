part of 'followed_technologies_cubit.dart';

@immutable
abstract class FollowedTechnologiesState{}

class FollowedTechnologiesInitial extends FollowedTechnologiesState {}

class FollowedTechnologiesLoading extends FollowedTechnologiesState {}

class FollowedTechnologiesSuccess extends FollowedTechnologiesState {
  final FollowedTechnologiesModel info;
  FollowedTechnologiesSuccess(this.info);
}

class FollowedTechnologiesFailure extends FollowedTechnologiesState {
  final String errMessage;
  FollowedTechnologiesFailure(this.errMessage);
}