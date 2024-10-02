part of 'expert_profile_cubit.dart';

class ExpertProfileState extends Equatable {
  const ExpertProfileState();
  @override
  List<Object?> get props => [];
}

class ExpertProfileInitial extends ExpertProfileState {}

class ExpertProfileLoading extends ExpertProfileState {}

class ExpertProfileFailure extends ExpertProfileState {
  final String errMessage;
  const ExpertProfileFailure(this.errMessage);
}

class ExpertProfileSuccess extends ExpertProfileState {
  final ExpertProfileModel info;
  const ExpertProfileSuccess(this.info);
}
