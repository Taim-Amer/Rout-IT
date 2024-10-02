import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/features/roadmaps/data/models/chat_model.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/chat_cubit/chat_cubit.dart';
import 'package:route_it27/features/roadmaps/presentation/views/road_map_community/widgets/chat_bubble.dart';
import 'package:route_it27/features/roadmaps/presentation/views/road_map_community/widgets/community_chat_header.dart';

class CommunityChatView extends StatelessWidget {
  const CommunityChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            AppColors.darkPrimaryColor,
            AppColors.primaryColor,
            AppColors.secondaryColor2,
          ])),
      child: Scaffold(
                backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const CommunityChatHeader(),
          leading: const CustomBackButton2(),
          backgroundColor: AppColors.primaryColor.withOpacity(0.6),
        ),
        body: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<ChatCubit>().focusNode.unfocus();
                },
                child: Align(
                  alignment: Alignment.topCenter,
                  child: BlocBuilder<ChatCubit, List<Chat>>(
                    builder: (context, chatList) {
                      return ListView.separated(
                        shrinkWrap: true,
                        reverse: true,
                        padding: EdgeInsets.only(
                                top: HelperFunctions.screenHeight(context) *
                                    0.02,
                                bottom: HelperFunctions.screenHeight(context) *
                                    0.03) +
                            EdgeInsets.symmetric(
                                horizontal:
                                    HelperFunctions.screenWidth(context) *
                                        horizintalMargin),
                        separatorBuilder: (_, __) => SizedBox(
                          height: HelperFunctions.screenHeight(context) * 0.01,
                        ),
                        controller: context.read<ChatCubit>().scrollController,
                        itemCount: chatList.length,
                        itemBuilder: (context, index) {
                          return Bubble(
                              chat: chatList.reversed.toList()[index]);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            const _BottomInputField(),
          ],
        ),
      ),
    );
  }
}

/// Bottom Fixed Field
class _BottomInputField extends StatelessWidget {
  const _BottomInputField();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        constraints: BoxConstraints(
            minHeight: HelperFunctions.screenHeight(context) * 0.07),
        width: double.infinity,
        decoration:
            BoxDecoration(color: AppColors.primaryColor.withOpacity(0.6)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: HelperFunctions.screenWidth(context) * horizintalMargin,
                left: HelperFunctions.screenWidth(context) * horizintalMargin,
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
                focusNode: context.read<ChatCubit>().focusNode,
                controller:
                    BlocProvider.of<ChatCubit>(context).textEditingController,
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
                  hintText: 'Type message...',
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
                onPressed: context.read<ChatCubit>().onFieldSubmitted),
          ],
        ),
      ),
    );
  }
}
