import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';

class CommunityChatHeader extends StatelessWidget {
  const CommunityChatHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: HelperFunctions.screenHeight(context) * 0.03,
          backgroundColor: AppColors.secondaryColor,
          child: ClipOval(child: Image.asset(AssetsData.avatarImg)),
        ),
        SizedBox(
          width: HelperFunctions.screenWidth(context) * 0.03,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Laravel Begginers",
                style: Theme.of(context).textTheme.headlineSmall!,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
              ),
              Text(
                "1.2k",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}
