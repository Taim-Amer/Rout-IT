import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/skill_nav_bar_cubit/skill_nav_bar_cubit.dart';

class SkillNavBar extends StatelessWidget {
  const SkillNavBar({
    super.key,
    required this.currentIndex,
    required this.skillPages,
  });

  final int currentIndex;
  final List skillPages;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
          HelperFunctions.screenWidth(context) * horizintalMargin),
      height: HelperFunctions.screenWidth(context) * .155,
      child: ListView.builder(
        itemCount: skillPages
            .length, 
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  HelperFunctions.screenWidth(context) * horizintalMargin * 3),
          child: InkWell(
            onTap: () {
              BlocProvider.of<SkillNavBarCubit>(context).tabChange(index);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: HelperFunctions.screenWidth(context) * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex
                          ? HelperFunctions.screenWidth(context) * .12
                          : 0,
                      width: index == currentIndex
                          ? HelperFunctions.screenWidth(context) * .2125
                          : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.white.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(curv),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: HelperFunctions.screenWidth(context) * .2125,
                      alignment: Alignment.center,
                      child: Text(skillPages[index]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
