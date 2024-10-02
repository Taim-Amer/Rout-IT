import 'package:meta/meta.dart';

@immutable
abstract class ToggleFollowCompanyState {}

class ToggleFollowCompanyInitial extends ToggleFollowCompanyState {}

class ToggleFollowCompanyLoading extends ToggleFollowCompanyState {
  final int id;
  ToggleFollowCompanyLoading(this.id);
}

class ToggleFollowCompanySuccess extends ToggleFollowCompanyState {
  final int id;
  final bool isFollowing;
  ToggleFollowCompanySuccess(this.id, this.isFollowing);
}

class ToggleFollowCompanyFailure extends ToggleFollowCompanyState {
  final int id;
  final String errMessage;
  ToggleFollowCompanyFailure(this.id, this.errMessage);
}
