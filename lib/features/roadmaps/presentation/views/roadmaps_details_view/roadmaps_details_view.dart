import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/constants/text_strings.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it27/features/roadmaps/presentation/views/roadmaps_details_view/widgets/community_button.dart';
import 'package:route_it27/features/roadmaps/presentation/views/roadmaps_details_view/widgets/roadmap_details_images.dart';
import 'package:route_it27/features/roadmaps/presentation/views/roadmaps_details_view/widgets/roadmap_skills.dart';

class RoadMapsDetailsView extends StatelessWidget {
  const RoadMapsDetailsView({super.key, required this.roadMapModel});

  final RoadMapModel roadMapModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton2(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(
                    HelperFunctions.screenWidth(context) * horizintalMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(roadMapModel.title!,
                        style: Theme.of(context).textTheme.headlineLarge),
                    RoadMapDetailsMedia(roadMapModel: roadMapModel),
                    RoadMapSkills(
                      roadMapModel: roadMapModel,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical:
                              HelperFunctions.screenHeight(context) * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            RouteITTexts.roadMapCommunity,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(
                            height:
                                HelperFunctions.screenHeight(context) * 0.03,
                          ),
                          const CommunityButton()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // _buildSwipeButton(),
        ],
      ),
    );
  }
}
