
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/add_comment_cubit/add_comment_cubit.dart';

class CommentInputField extends StatelessWidget {
  const CommentInputField({
    super.key,
    required this.skillId,
    required this.scrollController,
    required this.context,
    this.onTap,
  });

  final Function()? onTap;
  final int skillId;
  final ScrollController scrollController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        constraints: BoxConstraints(
            minHeight: HelperFunctions.screenHeight(context) * 0.06),
        width: double.infinity,
        decoration:
            BoxDecoration(color: AppColors.darkPrimaryColor.withOpacity(0.6)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: HelperFunctions.screenWidth(context) * 0.03,
                left: HelperFunctions.screenWidth(context) * 0.03,
              ),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.file(
                    fit: BoxFit.cover,
                    width: HelperFunctions.screenWidth(context) * 0.12,
                    height: HelperFunctions.screenWidth(context) * 0.12,
                    File(CacheServices.getData(key: "PofileImg")),
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('Error loading image');
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                focusNode: context.read<AddCommentCubit>().focusNode,
                controller:
                    BlocProvider.of<AddCommentCubit>(context).commentController,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                    right: 42,
                    left: 16,
                    top: 18,
                  ),
                  hintText: 'Message...',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            IconButton(
                icon: Image.asset(
                  AssetsData.sendIcon,
                  width: HelperFunctions.screenWidth(context) * 0.06,
                  height: HelperFunctions.screenWidth(context) * 0.06,
                ),
                onPressed: onTap),
          ],
        ),
      ),
    );
  }
}
