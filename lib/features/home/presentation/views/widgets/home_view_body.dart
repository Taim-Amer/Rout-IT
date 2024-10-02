// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/features/home/presentation/view_models/techology_categories_cubit.dart/technology_categories_cubit.dart';
import 'package:route_it27/features/home/presentation/views/widgets/grid_cards_builder.dart';
import 'package:route_it27/features/home/presentation/views/widgets/home_header.dart';
import 'package:route_it27/features/home/presentation/views/widgets/home_shimmer.dart';
import 'package:route_it27/features/home/presentation/views/widgets/home_welcome_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () {
        return BlocProvider.of<TechnologyCategoriesCubit>(context)
            .fetchAllCategories();
      },
      color: AppColors.primaryColor,
      backgroundColor: AppColors.lightPrimaryColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * horizintalMargin,
                vertical: size.height * verticalMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(
                  size: size,
                  userName: CacheServices.getData(key: "userName"),
                  onTapFunction: () {
                    //! here we Navigate to the notifications Screen
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                HomeWelcomeCard(size: size),
                SizedBox(
                  height: size.height * 0.03,
                ),
                BlocBuilder<TechnologyCategoriesCubit,
                    TechnologyCategoriesState>(
                  builder: (context, state) {
                    if (state is TechnologyCategoriesLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Technologies",
                            style: GoogleFonts.lato(
                                fontSize: MyTextStyles.titleSize,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          GridCardsBuilder(
                            size: size,
                            categoriesList: state.technologyCategories,
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          
                        ],
                      );
                    } else if (state is TechnologyCategoriesFailure) {
                      return CustomErrorWidget(
                        errormessage: state.errMessage,
                      );
                    } else {
                      return
                      
                       HomeShimmer(size: size);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errormessage,
  });
  final String errormessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline_outlined,
            color: Colors.red,
            size: 100,
          ),
          Text(
            'Oops... something went wrong $errormessage}',
          ),
        ],
      ),
    );
  }
}
