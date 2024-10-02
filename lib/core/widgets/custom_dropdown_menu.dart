import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/features/register/presentation/view_models/menu_cubit/menu_cubit.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({super.key, required this.controller, required this.size});

  final TextEditingController controller;
  final double size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    MenuCubit.get(context).tap();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    height: MenuCubit.get(context).changeMenuHeight(),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.darkPrimaryColor.withOpacity(.5),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkPrimaryColor.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: MenuCubit.get(context).isTapped
                        ? Center(
                            child: Text(
                              controller.text.isEmpty ? 'Select your college' : controller.text,
                              style: const TextStyle(
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w600,
                                color: AppColors.lightPrimaryColor,
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  itemCount: MenuCubit.get(context).university.length,
                                  separatorBuilder: (context, index) {
                                    return const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 10,
                                      ),
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        controller.text = MenuCubit.get(context).university[index];
                                        MenuCubit.get(context).tap();
                                        // print(controller.text);
                                        // print(controller.text);
                                        // print(controller.text);
                                        // print(controller.text);
                                        // print(controller.text);
                                        // print(controller.text);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              MenuCubit.get(context).university[index],
                                              style: const TextStyle(
                                                  letterSpacing: 1.5,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.lightPrimaryColor,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
