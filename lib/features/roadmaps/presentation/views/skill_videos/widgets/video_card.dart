import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';

class VideoCard extends StatelessWidget {
  final String category;
  final String title;
  final String imagePath;
  final double progress;

  const VideoCard({
    super.key,
    required this.category,
    required this.title,
    required this.imagePath,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColor,
      elevation: 5,
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
            )),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    const Icon(
                      Icons.play_arrow_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(width: HelperFunctions.screenWidth(context) * 0.05),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          progress == 1.0 ? 'Completed' : 'Not Completed',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey[400],
                                  ),
                        ),
                        Text(
                          '${(progress * 100).toStringAsFixed(0)}%',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey[300],
                      color: progress == 1.0
                          ? Colors.greenAccent
                          : AppColors.secondaryColor,
                      minHeight: 5,
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
