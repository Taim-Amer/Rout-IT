import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/followed_companies_cubit/followd_companies_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/followed_experts_cubit/followed_experts_cubit.dart';
import 'package:route_it27/features/user/presentation/view_model/followed_technologies_cubit/followed_technologies_cubit.dart';

class CustomButtomNavBar extends StatelessWidget {
  const CustomButtomNavBar({
    super.key,
    required this.size,
    required this.currentIndex,
    required this.listOfIcons,
  });

  final Size size;
  final int currentIndex;
  final List<IconData> listOfIcons;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * horizintalMargin,
        vertical: size.width * 0.02,
      ),
      height: size.width * .155,
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(curv),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(listOfIcons.length, (index) {
          return GestureDetector(
            onTap: () {
              if (index == 3) {
                context.read<FollowedExpertsCubit>().showFollowedExperts(
                    id: CacheServices.getData(key: "user_id"));
                context.read<FollowedCompaniesCubit>().showFollowedCompanies(
                    id: CacheServices.getData(key: "user_id"));
                context
                    .read<FollowedTechnologiesCubit>()
                    .showFollowedTechnologies(
                        id: CacheServices.getData(key: "user_id"));
              }
              BlocProvider.of<BottomNavBarCubit>(context).tabChange(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
              padding: EdgeInsets.symmetric(
                  vertical: size.width * 0.03, horizontal: size.width * 0.03),
              decoration: BoxDecoration(
                color: index == currentIndex
                    ? Colors.white.withOpacity(.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(curv),
              ),
              child: Icon(
                listOfIcons[index],
                size: size.width * .076,
                color: index == currentIndex ? Colors.white : Colors.grey,
              ),
            ),
          );
        }),
      ),
    );
  }
}
