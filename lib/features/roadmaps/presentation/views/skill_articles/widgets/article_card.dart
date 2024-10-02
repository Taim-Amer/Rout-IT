import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String author;
  final String timeAgo;
  final String category;
  final Color categoryColor;

  const ArticleCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.author,
    required this.timeAgo,
    required this.category,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(
        vertical: HelperFunctions.screenWidth(context) * 0.02,
        horizontal: HelperFunctions.screenWidth(context) * horizintalMargin,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.asset(
                      imagePath,
                      width: HelperFunctions.screenWidth(context) * 0.3,
                      height: HelperFunctions.screenWidth(context) * 0.35,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ),
              SizedBox(width: HelperFunctions.screenWidth(context) * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                        height: HelperFunctions.screenWidth(context) * 0.01),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(imagePath),
                        ),
                        SizedBox(
                            width: HelperFunctions.screenWidth(context) * 0.02),
                        Text(
                          author,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(),
                        ),
                        SizedBox(
                            width:
                                HelperFunctions.screenWidth(context) * 0.012),
                        Text(
                          '•',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(),
                        ),
                        SizedBox(
                            width:
                                HelperFunctions.screenWidth(context) * 0.012),
                        Text(
                          timeAgo,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: HelperFunctions.screenWidth(context) * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: categoryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: categoryColor),
                          ),
                          child: Text(
                            category.toUpperCase(),
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: categoryColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                          ),
                        ),
                        const Icon(
                          Iconsax.bookmark_2,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
