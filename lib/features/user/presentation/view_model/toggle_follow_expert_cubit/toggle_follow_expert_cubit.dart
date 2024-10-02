import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/features/user/data/repo/user_repo.dart';
import 'package:route_it27/features/user/presentation/view_model/toggle_follow_expert_cubit/toggle_follow_expert_state.dart';



class ToggleFollowExpertCubit extends Cubit<ToggleFollowExpertState> {
  ToggleFollowExpertCubit({required this.followExpertRepo})
      : super(ToggleFollowExpertInitial());

  final UserRepo followExpertRepo;
  final Map<int, bool> followStates = {};

  Future<void> toggleFollowExpert({required int id}) async {
    emit(ToggleFollowExpertLoading(id));
    final response = await followExpertRepo.toggleFollowExpert(id: id);

    response.fold(
      (failure) => emit(ToggleFollowExpertFailure(id, failure.errMessage)),
      (success) {
        final isFollowing = !(followStates[id] ?? false);
        followStates[id] = isFollowing;
        emit(ToggleFollowExpertSuccess(id, isFollowing));
      },
    );
  }

  bool isFollowing(int id) => followStates[id] ?? false;
}

