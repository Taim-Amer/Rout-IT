import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:route_it27/core/widgets/add_comment_field.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/add_comment_cubit/add_comment_cubit.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:route_it27/features/roadmaps/presentation/views/skill_comments/widgets/comment.dart';
import 'package:route_it27/features/roadmaps/presentation/views/skill_comments/widgets/comments_shimmer.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';

class SkillComments extends StatelessWidget {
  final ScrollController scrollController;
  final int skillId;

  const SkillComments({
    super.key,
    required this.scrollController,
    required this.skillId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const Center(
            child: Text(
              "Comments",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: HelperFunctions.screenHeight(context) * 0.02),
          Expanded(
            child: BlocBuilder<CommentsCubit, CommentsState>(
              builder: (context, state) {
                if (state is CommentsLoading) {
                  return ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16.0),
                    itemCount: 5, // Number of shimmer items to display
                    itemBuilder: (context, index) {
                      return CommentsShimmer(context: context);
                    },
                  );
                } else if (state is CommentsLoaded) {
                  return GestureDetector(
                    onTap: () =>
                        context.read<AddCommentCubit>().focusNode.unfocus(),
                    child: AnimationLimiter(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        shrinkWrap: true,
                        controller: scrollController,
                        padding: const EdgeInsets.all(16.0),
                        itemCount: state.comments.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 100),
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 2500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              verticalOffset: -250,
                              child: ScaleAnimation(
                                duration: const Duration(milliseconds: 1500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Comment(
                                  username: state.comments.reversed
                                      .toList()[index]
                                      .name!,
                                  comment: state.comments.reversed
                                      .toList()[index]
                                      .comment!,
                                  image: state.comments.reversed
                                      .toList()[index]
                                      .image!,
                                  context: context,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                        "There are no comments :(\nStart the conversation"),
                  );
                }
              },
            ),
          ),
          CommentInputField(
            skillId: skillId,
            scrollController: scrollController,
            context: context,
            onTap: () => context.read<AddCommentCubit>().addComment(
                  roadMapSkillId: skillId,
                  scrollController: scrollController,
                  commentsCubit: context.read<CommentsCubit>(),
                ),
          ),
        ],
      ),
    );
  }
}
