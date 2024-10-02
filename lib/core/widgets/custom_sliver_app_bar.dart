import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_shader_mask.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key, required this.size, required this.img, required this.title});

  final Size size;
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(fontSize: 25),
      ),
      centerTitle: true,
      leading: const CustomBackButton2(),
      backgroundColor: AppColors.darkPrimaryColor,
      expandedHeight: size.height * 0.18,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
        background: CustomShaderMasK(
            fadeInColor: AppColors.darkPrimaryColor,
            imageUrl: img,
            width: size.width,
            height: size.height * 0.4),
      ),
    );
  }
}
