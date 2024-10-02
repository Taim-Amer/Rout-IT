
// comments_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/roadmaps/data/models/comments_model.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(this.roadMapRepo) : super(CommentsInitial());

  final RoadMapRepo roadMapRepo;

  Future<void> fetchComments({required int roadMapSkillId}) async {
    emit(CommentsLoading());
    var finalResponse =
        await roadMapRepo.fetchComments(roadMapSkillId: roadMapSkillId);
    finalResponse.fold(
      (failure) {
        print("we got an error in the comments section");
        emit(CommentsFailure(errMessage: failure.errMessage));
      },
      (success) {
        print("we got the comments");
        emit(CommentsLoaded(comments: success.comments!));
      },
    );
  }

  // Add a new comment to the current list
  void addComment(Comments comment) {
    final currentState = state;
    if (currentState is CommentsLoaded) {
      final updatedComments = List<Comments>.from(currentState.comments)
        ..add(comment);
        emit(CommentsLoading());
      emit(CommentsLoaded(comments: updatedComments));
    }
  }
}
