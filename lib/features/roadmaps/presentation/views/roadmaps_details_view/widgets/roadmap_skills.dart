import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/text_strings.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/widgets/custom_expandable_text.dart';
import 'package:route_it27/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it27/features/roadmaps/data/models/roadmap_skills_model.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/roadmap_skills_cubit/road_map_skills_cubit.dart';
import 'package:route_it27/features/roadmaps/presentation/views/roadmaps_details_view/widgets/info_container.dart';
import 'package:route_it27/features/roadmaps/presentation/views/roadmaps_details_view/widgets/roadmap_details_shimmer.dart';
import 'package:route_it27/features/roadmaps/presentation/views/roadmaps_details_view/widgets/skill_tile.dart';

class RoadMapSkills extends StatelessWidget {
  const RoadMapSkills({
    super.key,
    required this.roadMapModel,
  });

  final RoadMapModel roadMapModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoadMapSkillsCubit, RoadMapSkillsState>(
      builder: (context, state) {
        if (state is RoadMapSkillsLoaded) {
          List<RoadMapSkillsModel> skills = state.skills;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: InfoContainer(
                        context: context,
                        icon: Iconsax.clock,
                        text: "12h 56min"),
                  ),
                  SizedBox(width: HelperFunctions.screenWidth(context) * 0.02),
                  Expanded(
                    child: InfoContainer(
                        context: context,
                        icon: Iconsax.document,
                        text: "${skills.length} Skills"),
                  ),
                ],
              ),
              SizedBox(
                height: HelperFunctions.screenHeight(context) * 0.02,
              ),
              CustomExpandableText(content: roadMapModel.description),
              SizedBox(
                height: HelperFunctions.screenHeight(context) * 0.02,
              ),
              Text(
                RouteITTexts.roadMapPreview,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: HelperFunctions.screenHeight(context) * 0.02,
              ),
              Column(
                children: skills.map((skill) {
                  return SkillTile(
                    skill: skill,
                    title: skill.title!,
                    skillDescription: "Skill Description here",
                    isComplete: true, // Replace with actual completion status
                  );
                }).toList(),
              ),
            ],
          );
        } else if (state is RoadMapSkillsFailure) {
          return const Center(child: Text("failed"));
        } else {
          return 
          const RoadMapDetailsShimmer();
        }
      },
    );
  }
}
