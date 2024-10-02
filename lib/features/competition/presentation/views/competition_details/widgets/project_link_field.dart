import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/widgets/custom_toast.dart';
import 'package:route_it27/features/competition/data/models/competition_model.dart';
import 'package:route_it27/features/competition/presentation/view_models/add_project_link_cubit/add_project_link_cubit.dart';
import 'package:route_it27/features/competition/presentation/view_models/competitor_cubit/competitor_cubit.dart';

class ProjectLinkField extends StatelessWidget {
  final Competitions competition;
  const ProjectLinkField({super.key, required this.competition});

  @override
  Widget build(BuildContext context) {
    final TextEditingController linkController = TextEditingController();

    return BlocConsumer<AddProjectLinkCubit, AddProjectLinkState>(
      listener: (context, state) {
        if (state is AddProjectLinkSuccess) {
          showToast(state.projectLinkModel.message ?? "", ToastState.SUCCESS);
          BlocProvider.of<CompetitorCubit>(context)
              .fetchAllCompetitors(competionId: competition.id!);
        } else if (state is AddProjectLinkFailure) {
          showToast(state.errMessage, ToastState.ERROR);
        }
      },
      builder: (context, state) {
        if (state is AddProjectLinkLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Project Link",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryColor, AppColors.darkPrimaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: linkController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.secondaryColor.withOpacity(0.1),
                          hintText: "Enter project link here",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 15.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<AddProjectLinkCubit>(context)
                            .addProjectLink(
                          competitionId: competition.id!,
                          projectLink: linkController.text,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [AppColors.secondaryColor, AppColors.primaryColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: const Icon(
                          Iconsax.send1,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
