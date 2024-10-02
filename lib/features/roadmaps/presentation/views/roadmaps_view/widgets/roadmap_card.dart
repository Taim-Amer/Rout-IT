import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/widgets/cached_network_image.dart';
import 'package:route_it27/features/roadmaps/data/models/roadmap_model.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/road_map_ranking_cubit/road_map_ranking_cubit_cubit.dart';

class RoadMapCard extends StatefulWidget {
  const RoadMapCard({
    super.key,
    required this.roadmap,
  });

  final RoadMapModel roadmap;

  @override
  State<RoadMapCard> createState() => _RoadMapCardState();
}

class _RoadMapCardState extends State<RoadMapCard> {
  @override
  void initState() {
    BlocProvider.of<RoadMapRankingCubitCubit>(context)
        .roadMapRanking(roadMapId: widget.roadmap.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HelperFunctions.screenWidth(context),
      margin: EdgeInsets.only(
          bottom:
              (HelperFunctions.screenWidth(context) * horizintalMargin) * 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoadMapCardCover(roadmap: widget.roadmap),

          /// here we fetch the Expert Name and Image
          Container(
            padding: EdgeInsets.all(
                HelperFunctions.screenWidth(context) * horizintalMargin),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => GoRouter.of(context).push(
                      AppRouter.kExpertProfile,
                      extra: widget.roadmap.expertId),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(imageUrl+widget.roadmap.expert!.image!),
                  ),
                ),
                SizedBox(width: HelperFunctions.screenWidth(context) * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.roadmap.expert!.name!,
                        style: Theme.of(context).textTheme.headlineSmall),
                    Text(
                      widget.roadmap.expert!.email!,
                      
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// here we put the Road Map Title
          Padding(
            padding: EdgeInsets.only(
              left: HelperFunctions.screenWidth(context) * horizintalMargin,
              right: HelperFunctions.screenWidth(context) * horizintalMargin,
              bottom: HelperFunctions.screenWidth(context) * horizintalMargin,
            ),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '${widget.roadmap.title}:',
                    style: Theme.of(context).textTheme.headlineMedium),
                TextSpan(
                    text:
                        '  ${widget.roadmap.description!.split(' ').take(5).join(' ')} ....',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontStyle: FontStyle.italic)),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    HelperFunctions.screenWidth(context) * horizintalMargin,
                vertical:
                    HelperFunctions.screenWidth(context) * horizintalMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kRoadMapRanking,
                        extra: widget.roadmap.id);
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.secondaryColor,
                    child: Center(
                      child: SizedBox(
                          width: HelperFunctions.screenWidth(context) * 0.06,
                          height: HelperFunctions.screenHeight(context) * 0.04,
                          child: Image.asset(
                            "assets/images/trophy.png",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  width: HelperFunctions.screenWidth(context) * 0.15,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kRoadMapsDetailsView,
                          extra: widget.roadmap);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: const BorderSide(color: Colors.transparent),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Start",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const Icon(
                          Iconsax.play,
                          color: Colors.white,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoadMapCardCover extends StatelessWidget {
  const RoadMapCardCover({
    super.key,
    required this.roadmap,
  });

  final RoadMapModel roadmap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25), bottom: Radius.circular(25)),
          child: CachedNetworkImg(
              img: roadmap.cover!,
              placeHolder: AssetsData.placeHolderImg,
              width: HelperFunctions.screenWidth(context),
              height: HelperFunctions.screenHeight(context) * 0.23),
        ),
        Positioned(
            top: HelperFunctions.screenWidth(context) * horizintalMargin,
            right: HelperFunctions.screenWidth(context) * horizintalMargin,
            child: InkWell(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: AppColors.secondaryColor,
                child: Center(
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
