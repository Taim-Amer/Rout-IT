import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/roadmaps/data/models/comments_model.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/comments_cubit/comments_cubit.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit(this.roadMapRepo) : super(AddCommentInitial());
  final RoadMapRepo roadMapRepo;
  final FocusNode focusNode = FocusNode();
  final TextEditingController commentController = TextEditingController();

  Future<void> addComment({
    required int roadMapSkillId,
    required ScrollController scrollController,
    required CommentsCubit commentsCubit,
  }) async {
    final newCommentText = commentController.text.trim();

    if (newCommentText.isNotEmpty) {
      final newComment = Comments(
        name: CacheServices.getData(key: "userName"),
        comment: newCommentText,
        image: CacheServices.getData(key: "PofileImg"),
      );

      commentsCubit.addComment(newComment);

      var finalResponse = await roadMapRepo.addComment(
        roadMapSkillId: roadMapSkillId,
        comment: newCommentText,
      );

      finalResponse.fold(
        (failure) {
          emit(AddCommentFailure(errMessage: failure.errMessage));
        },
        (success) {
          commentController.clear();
          scrollController.animateTo(
            scrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          emit(AddCommentLoaded());
        },
      );
    }
  }
}
