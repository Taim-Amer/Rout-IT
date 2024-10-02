
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/router/app_router.dart';

class CommunityButton extends StatelessWidget {
  const CommunityButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context)
          .push(AppRouter.kCommunityChatView),
      child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(20.0)),
            color: AppColors.primaryColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(
                HelperFunctions.screenWidth(context) *
                    horizintalMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: HelperFunctions.screenHeight(
                          context) *
                      0.03,
                  backgroundColor:
                      AppColors.secondaryColor,
                  child: ClipOval(
                      child: Image.asset(
                          AssetsData.avatarImg)),
                ),
                SizedBox(
                  width: HelperFunctions.screenWidth(
                          context) *
                      0.03,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Laravel Begginers",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                      ),
                      Text(
                        "1.2k",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
