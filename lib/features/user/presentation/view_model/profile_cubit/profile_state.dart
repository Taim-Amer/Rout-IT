part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final MyProfile myProfile;

  const ProfileLoaded({required this.myProfile});
}

class ProfileFailure extends ProfileState {
  final String errMesage;

  const ProfileFailure({required this.errMesage});
}
