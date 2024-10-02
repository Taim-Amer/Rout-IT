import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_it27/features/user/data/models/followed_experts_model.dart';
import 'package:route_it27/features/user/data/repo/user_repo.dart';

part 'followed_experts_state.dart';

class FollowedExpertsCubit extends Cubit<FollowedExpertsState> {
  FollowedExpertsCubit({required this.followedExpertsRepo})
      : super(FollowedExpertsInitial());

  static FollowedExpertsCubit get(context) => BlocProvider.of(context);

  final UserRepo followedExpertsRepo;

  Future<void> showFollowedExperts({required int id}) async {
    emit(FollowedExpertsLoading());

    var finalResponse = await followedExpertsRepo.showFollowedExperts(id: id);

    finalResponse.fold(
        (failure) => emit(FollowedExpertsFailure(failure.errMessage)),
        (success) => emit(FollowedExpertsSuccess(success)));
  }
}
