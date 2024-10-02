import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_it27/features/user/data/models/toggle_follow_technology_model.dart';
import 'package:route_it27/features/user/data/repo/user_repo.dart';

part 'toggle_follow_technology_state.dart';

class ToggleFollowTechnologyCubit extends Cubit<ToggleFollowTechnologyState> {
  ToggleFollowTechnologyCubit({required this.followTechnologyRepo})
      : super(ToggleFollowTechnologyInitial());

  final UserRepo followTechnologyRepo;
  final Map<int, bool> followStates = {};  // Store follow state per technology

  Future<void> toggleFollowTechnology({required int id}) async {
    emit(ToggleFollowTechnologyLoading(id));
    var finalResponse = await followTechnologyRepo.toggleFollowTechnology(id: id);

    finalResponse.fold(
      (failure) => emit(ToggleFollowTechnologyFailure(id, failure.errMessage)),
      (success) {
        final isFollowing = !(followStates[id] ?? false);
        followStates[id] = isFollowing;
        emit(ToggleFollowTechnologySuccess(id, isFollowing));
      },
    );
  }

  bool isFollowing(int id) => followStates[id] ?? false;
}
