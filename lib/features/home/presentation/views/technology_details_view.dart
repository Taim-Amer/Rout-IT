import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_error_item.dart';
import 'package:route_it27/core/widgets/custom_expandable_text.dart';
import 'package:route_it27/features/home/data/models/technologies_model.dart';
import 'package:route_it27/features/home/data/models/technology_category_model.dart';
import 'package:route_it27/features/home/presentation/view_models/technology_cubit/technology_cubit.dart';
import 'package:route_it27/features/home/presentation/views/widgets/frame_work_card.dart';

import 'widgets/framework_cards_shimmer.dart';

class TechnologyDetailsView extends StatelessWidget {
  const TechnologyDetailsView(
      {super.key, required this.technologyCategoryModel});
  final TechnologyCategoryModel technologyCategoryModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: const CustomBackButton2(),
        title: Text(
          technologyCategoryModel.name!,
          style: const TextStyle(fontSize: MyTextStyles.titleSize),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * horizintalMargin,
            vertical: size.width * horizintalMargin),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description",
                style: TextStyle(fontSize: MyTextStyles.titleSize),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomExpandableText(
                content: technologyCategoryModel.description,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              BlocBuilder<TechnologyCubit, TechnologyState>(
                builder: (context, state) {
                  if (state is TechnologySuccess) {
                    List<TechnologiesModel> loadedTechnologies =
                        state.technologiesModel;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "FrameWorks",
                          style: TextStyle(fontSize: MyTextStyles.titleSize),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: loadedTechnologies.length,
                          //padding: EdgeInsets.only(bottom: 100),
                          itemBuilder: (context, index) {
                            return FrameWorkCard(
                                size: size,
                                loadedTehchnology: loadedTechnologies[index]);
                          },
                        )
                      ],
                    );
                  } else if (state is TechnologyFailure) {
                    return CustomErrorItem(errorMessage: state.errMessage);
                  } else {
                    return
                    
                     FrameWorkCardsShimmer(size: size);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
