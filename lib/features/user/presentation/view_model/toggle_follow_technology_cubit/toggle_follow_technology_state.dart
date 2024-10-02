part of 'toggle_follow_technology_cubit.dart';

@immutable
abstract class ToggleFollowTechnologyState {}

class ToggleFollowTechnologyInitial extends ToggleFollowTechnologyState {}

class ToggleFollowTechnologyLoading extends ToggleFollowTechnologyState {
  final int id;
  ToggleFollowTechnologyLoading(this.id);
}

class ToggleFollowTechnologySuccess extends ToggleFollowTechnologyState {
  final int id;
  final bool isFollowing;
  ToggleFollowTechnologySuccess(this.id, this.isFollowing);
}

class ToggleFollowTechnologyFailure extends ToggleFollowTechnologyState {
  final int id;
  final String errMessage;
  ToggleFollowTechnologyFailure(this.id, this.errMessage);
}
