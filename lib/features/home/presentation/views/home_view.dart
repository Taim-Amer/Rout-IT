import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/features/competition/presentation/views/competitions_view/competitions_view.dart';
import 'package:route_it27/features/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:route_it27/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:route_it27/features/search/presentation/views/general_search_view/general_search_view.dart';
import 'package:route_it27/features/user/presentation/views/my_profile.dart';

import 'widgets/custom_bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final List<IconData> listOfIcons = const [
    Iconsax.home,
    Icons.emoji_events,
    Iconsax.search_normal,
    Iconsax.profile_2user,
  ];

  final List<Widget> navPages = const [
    HomeViewBody(),
    CompetitionsView(),
    GeneralSearchView(),
    MyProfile() // Updated the last tab
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        int currentTabIndex = state.tabIndex;
        Size size = MediaQuery.of(context).size;
        return Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 1.2,
              stops: const [0.3, 1.0],
              center: const Alignment(-0.5, -0.3),
              colors: [
                AppColors.primaryColor,
                AppColors.darkPrimaryColor.withOpacity(0.5),
              ],
            ),
          ),
          child: Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            bottomNavigationBar: CustomButtomNavBar(
              size: size,
              currentIndex: currentTabIndex,
              listOfIcons: listOfIcons,
            ),
            body: navPages.elementAt(currentTabIndex),
          ),
        );
      },
    );
  }
}
