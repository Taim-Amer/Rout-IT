import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/features/roadmaps/data/models/road_map_ranking.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/road_map_ranking_cubit/road_map_ranking_cubit_cubit.dart';

import 'package:route_it27/core/utils/constants/assets_data.dart';

class RoadMapRankingView extends StatelessWidget {
  const RoadMapRankingView({super.key, required this.roadMapId});
  final int roadMapId;

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPrimaryColor,
      appBar: AppBar(
        leading: const CustomBackButton2(),
        backgroundColor: AppColors.darkPrimaryColor,
        elevation: 0,
        title: const Text('RoadMap Ranking'),
      ),
      body: BlocBuilder<RoadMapRankingCubitCubit, RoadMapRankingCubitState>(
        builder: (context, state) {
          if (state is RoadMapRankingCubitLoaded) {
            return Column(
              children: [
                SizedBox(height: HelperFunctions.screenHeight(context) * 0.03),
                _buildLeaderboard(state.topuser),
                SizedBox(height: HelperFunctions.screenHeight(context) * 0.03),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: HelperFunctions.screenWidth(context) *
                            horizintalMargin),
                    itemCount: state.topuser.length,
                    itemBuilder: (context, index) {
                      final ranking = state.topuser[index];
                      return _buildRankCard(
                        '${index + 1}th',
                        ranking.name ?? 'Unknown',
                        ranking.pivot?.userXP ?? 0,
                        ranking.image ?? AssetsData.welcomeImg,
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is RoadMapRankingCubitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(child: Text("There is no ranking (:"));
          }
        },
      ),
    );
  }
}

Widget _buildLeaderboard(List<Ranking> rankings) {
  if (rankings.isEmpty) {
    return const Center(child: Text("No users to display."));
  }

  return Stack(
    alignment: Alignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (rankings.length > 1)
            _buildCircleAvatar(rankings[1].image ?? AssetsData.welcomeImg, 60),
          if (rankings.length > 2)
            const SizedBox(width: 120), // Placeholder for center image
          if (rankings.length > 2)
            _buildCircleAvatar(rankings[2].image ?? AssetsData.welcomeImg, 60),
        ],
      ),
      if (rankings.length > 0)
        Positioned(
          child: _buildCircleAvatar(
            rankings[0].image ?? AssetsData.welcomeImg,
            80,
            withCrown: true,
          ),
        ),
    ],
  );
}

Widget _buildCircleAvatar(String imagePath, double size,
    {bool withCrown = false}) {
  return Column(
    children: [
      if (withCrown)
        SizedBox(
            width: 35,
            height: 20,
            child: Image.asset(
              "assets/images/crown.png",
              fit: BoxFit.cover,
            )),
      Container(
        width: size,
        height: size,
        padding:
            const EdgeInsets.all(4.0), // Padding to make room for the border
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: (withCrown)
                ? Colors.yellow
                : AppColors.secondaryColor, // Border color
            width: 4.0, // Border width
          ),
        ),
        child: CircleAvatar(
          radius: (size - 8) / 2, // Adjust radius to account for the padding
          backgroundImage: NetworkImage(imageUrl+imagePath),
        ),
      ),
    ],
  );
}

Widget _buildRankCard(String rank, String name, int score, String imagePath) {
  return Card(
    color: AppColors.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 4,
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            rank,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(width: 16),
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(imageUrl+imagePath),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Text(
            '$score',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
