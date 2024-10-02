import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_error_item.dart';

import 'package:route_it27/features/roadmaps/presentation/views/roadmaps_view/widgets/roadmap_card.dart';
import 'package:route_it27/features/roadmaps/presentation/views/roadmaps_view/widgets/shimmer_animation_builder.dart';

import '../../view_models/roadmaps_cubit/road_maps_cubit.dart';

class RoadMapsView extends StatelessWidget {
  const RoadMapsView({super.key, required this.level});
  final String level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton2(),
        title: Text("$level Road Maps"),
      ),
      body: BlocBuilder<RoadMapsCubit, RoadMapsState>(
        builder: (context, state) {
          if (state is RoadMapsLoaded) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(
                  HelperFunctions.screenWidth(context) * horizintalMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: state.roadmaps.map((roadmap) {
                  return RoadMapCard(roadmap: roadmap);
                }).toList(),
              ),
            );
          } else if (state is RoadMapsFailure) {
            return CustomErrorItem(errorMessage: state.errMessage);
          } else {
            return 
            const ShimmerAnimationBuilder();
          }
        },
      ),
    );
  }
}
