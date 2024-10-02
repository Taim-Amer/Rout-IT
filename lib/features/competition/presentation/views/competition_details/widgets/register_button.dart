import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/features/competition/data/models/competition_model.dart';
import 'package:route_it27/features/competition/presentation/view_models/competition_register_cubit/competition_register_cubit.dart';
import 'package:slide_to_act/slide_to_act.dart';

class RegisterButton extends StatelessWidget {
  final Competitions competition;

  const RegisterButton({super.key, required this.competition});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompetitionRegisterCubit, CompetitionRegisterState>(
      listener: (context, state) {
        if (state is CompetitionRegisterLoaded) {
          // Handle success state
        } else if (state is CompetitionRegisterFailure) {
          // Handle failure state
        }
      },
      builder: (context, state) {
        if (state is CompetitionRegisterLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: SlideAction(
              sliderButtonIconPadding: 20,
              sliderButtonIconSize: 20,
              elevation: 4,
              outerColor: AppColors.primaryColor,
              innerColor: AppColors.darkPrimaryColor,
              sliderButtonIcon: const Icon(
                color: Colors.white,
                Icons.arrow_circle_right,
                size: 30,
              ),
              text: "Slide to Register",
              animationDuration: const Duration(milliseconds: 500),
              submittedIcon: const CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: AppColors.primaryColor,
              ),
              onSubmit: () {
                BlocProvider.of<CompetitionRegisterCubit>(context)
                    .registerCompettion(competitionId: competition.id!);
              },
            ),
          );
        }
      },
    );
  }
}
