import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/features/competition/data/models/competitor_models.dart';
import 'package:route_it27/features/competition/presentation/view_models/competitor_cubit/competitor_cubit.dart';
import 'package:route_it27/features/competition/presentation/views/competition_details/widgets/competitior_card.dart';
import 'package:route_it27/features/competition/presentation/views/competition_details/widgets/competitiors_list.dart';

class CompetitorList extends StatelessWidget {
  const CompetitorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitorCubit, CompetitorState>(
      builder: (context, state) {
        if (state is CompetitorLoaded) {
          List<Competitor> competitors = state.competitor;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: competitors.length >= 3 ? 4 : competitors.length + 1,
            itemBuilder: (context, index) {
              if (index == 3 || (competitors.length < 3 && index == competitors.length)) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompetitorListScreen(
                          competitors: competitors,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 3,
                    child: const Center(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return CompetitorCard(competitor: competitors[index]);
              }
            },
          );
        } else if (state is CompetitorLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text("There are no competitors"),
          );
        }
      },
    );
  }
}
