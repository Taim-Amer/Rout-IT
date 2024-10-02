import 'package:meta/meta.dart';

@immutable
abstract class ToggleFollowExpertState {}

class ToggleFollowExpertInitial extends ToggleFollowExpertState {}

class ToggleFollowExpertLoading extends ToggleFollowExpertState {
  final int id;
  ToggleFollowExpertLoading(this.id);
}

class ToggleFollowExpertSuccess extends ToggleFollowExpertState {
  final int id;
  final bool isFollowing;
  ToggleFollowExpertSuccess(this.id, this.isFollowing);
}

class ToggleFollowExpertFailure extends ToggleFollowExpertState {
  final int id;
  final String errMessage;
  ToggleFollowExpertFailure(this.id, this.errMessage);
}
