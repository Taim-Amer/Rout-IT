import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_it27/features/user/data/models/followed_technologies_model.dart';
import 'package:route_it27/features/user/data/repo/user_repo.dart';

part 'followed_technologies_state.dart';

class FollowedTechnologiesCubit extends Cubit<FollowedTechnologiesState> {
  FollowedTechnologiesCubit({required this.followedTechnologiesRepo})
      : super(FollowedTechnologiesInitial());

  static FollowedTechnologiesCubit get(context) => BlocProvider.of(context);

  final UserRepo followedTechnologiesRepo;

  Future<void> showFollowedTechnologies({required int id}) async {
    emit(FollowedTechnologiesLoading());

    var finalResponse =
        await followedTechnologiesRepo.showFollowedTechnologies(id: id);

    finalResponse.fold(
      (failure) => emit(FollowedTechnologiesFailure(failure.errMessage)),
      (success) => emit(FollowedTechnologiesSuccess(success)),
    );
  }
}
