import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/features/competition/data/models/competitor_models.dart';

class CompetitorCard extends StatelessWidget {
  final Competitor competitor;

  const CompetitorCard({super.key, required this.competitor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage:
                  (NetworkImage(imageUrl + competitor.competitorImage!)),
            ),
            const SizedBox(height: 6),
            Text(
              competitor.competitorName!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              'Competitor',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
