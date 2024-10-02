import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_it27/features/user/data/models/toggle_follow_company_model.dart';
import 'package:route_it27/features/user/data/repo/user_repo.dart';
import 'package:route_it27/features/user/presentation/view_model/toggle_follow_company_cubit/toggle_follow_company_state.dart';


class ToggleFollowCompanyCubit extends Cubit<ToggleFollowCompanyState> {
  ToggleFollowCompanyCubit({required this.followCompanyRepo})
      : super(ToggleFollowCompanyInitial());

  final UserRepo followCompanyRepo;
  final Map<int, bool> followStates = {};

  Future<void> toggleFollowCompany({required int id}) async {
    emit(ToggleFollowCompanyLoading(id));
    final response = await followCompanyRepo.toggleFollowCompany(id: id);

    response.fold(
      (failure) => emit(ToggleFollowCompanyFailure(id, failure.errMessage)),
      (success) {
        final isFollowing = !(followStates[id] ?? false);
        followStates[id] = isFollowing;
        emit(ToggleFollowCompanySuccess(id, isFollowing));
      },
    );
  }

  bool isFollowing(int id) => followStates[id] ?? false;
}
