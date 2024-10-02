import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/skill_nav_bar_cubit/skill_nav_bar_cubit.dart';
import 'package:route_it27/features/roadmaps/presentation/views/skill_articles/skill_articles_view.dart';
import 'package:route_it27/features/roadmaps/presentation/views/roadmap_skill/widgets/skill_nav_bar.dart';
import 'package:route_it27/features/roadmaps/presentation/views/skill_videos/roadmap_skill_videos_view.dart';

class SkillView extends StatelessWidget {
  const SkillView({super.key, required this.skillTitle});

  final String skillTitle;

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    List skillPages = ["Videos", "Articles"];
    List<Widget> skillViews = [
      const SkillVideosView(),
      const SkillArticlesView(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("$skillTitle Skill"),
        leading: const CustomBackButton2(),
      ),
      body: BlocBuilder<SkillNavBarCubit, SkillNavBarState>(
        builder: (context, state) {
          currentIndex = state.tabIndex;
          return Column(
            children: [
              SkillNavBar(currentIndex: currentIndex, skillPages: skillPages),
              Expanded(child: skillViews[state.tabIndex])
            ],
          );
        },
      ),
    );
  }
}
