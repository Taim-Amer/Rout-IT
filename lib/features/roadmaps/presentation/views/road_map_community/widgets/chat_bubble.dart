import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/roadmaps/data/models/chat_message_type.dart';
import 'package:route_it27/features/roadmaps/data/models/chat_model.dart';

class Bubble extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Chat chat;

  const Bubble({
    super.key,
    this.margin,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: chat.type == ChatMessageType.received
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (chat.type == ChatMessageType.received)
          Stack(
            children: [
              CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    fit: BoxFit.cover,
                    width: HelperFunctions.screenWidth(context) * 0.12,
                    height: HelperFunctions.screenWidth(context) * 0.12,
                    AssetsData.avatarImg,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('Error loading image');
                    },
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: HelperFunctions.screenWidth(context) * 0.03,
                    height: HelperFunctions.screenWidth(context) * 0.03,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green),
                  ))
            ],
          ),
        Flexible(
          child: IntrinsicWidth(
            child: Container(
              constraints: BoxConstraints(
                maxWidth:
                    HelperFunctions.screenWidth(context) * 0.7, // Set max width
              ),
              margin: chat.type == ChatMessageType.received
                  ? EdgeInsets.only(
                      top: HelperFunctions.screenHeight(context) * 0.01,
                      bottom: HelperFunctions.screenHeight(context) * 0.01,
                      left: HelperFunctions.screenWidth(context) * 0.03)
                  : EdgeInsets.only(
                      bottom: HelperFunctions.screenHeight(context) * 0.01,
                      top: HelperFunctions.screenHeight(context) * 0.01,
                      right: HelperFunctions.screenWidth(context) * 0.03),
              decoration: BoxDecoration(
                color: chat.type == ChatMessageType.received
                    ? AppColors.secondaryColor
                    : AppColors.lightPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                    bottomLeft: chat.type == ChatMessageType.sent
                        ? const Radius.circular(15)
                        : const Radius.circular(0),
                    bottomRight: chat.type == ChatMessageType.received
                        ? const Radius.circular(15)
                        : const Radius.circular(0)),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: HelperFunctions.screenWidth(context) *
                      horizintalMargin /
                      2,
                  horizontal:
                      HelperFunctions.screenWidth(context) * horizintalMargin),
              child: Column(
                crossAxisAlignment: chat.type == ChatMessageType.sent
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  if (chat.type == ChatMessageType.received)
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Rami",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      AppColors.whiteColor.withOpacity(0.6))),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    chat.message,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: null,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(DateFormat('h:mm a').format(chat.time),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.whiteColor.withOpacity(0.6))),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (chat.type == ChatMessageType.sent)
          CircleAvatar(
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
      ],
    );
  }
}
