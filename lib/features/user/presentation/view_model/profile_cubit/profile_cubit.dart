import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/user/data/models/my_profile_model.dart';
import 'package:route_it27/features/user/data/repo/user_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userRepo) : super(ProfileInitial());
  final UserRepo userRepo;
  Future<void> fetchProfile() async {
    var response = await userRepo.fetchProfile();
    response.fold(
        (failure) => emit(ProfileFailure(errMesage: failure.errMessage)),
        (success) => emit(ProfileLoaded(myProfile: success)));
  }
}
