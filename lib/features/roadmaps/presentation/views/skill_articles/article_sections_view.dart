import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/core/widgets/cached_network_image.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/features/roadmaps/presentation/view_models/article_sections_cubit/article_sections_cubit.dart';

class ArticleSectionsView extends StatelessWidget {
  const ArticleSectionsView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Articles"),
        leading: const CustomBackButton2(),
      ),
      body: BlocBuilder<ArticleSectionsCubit, ArticleSectionsState>(
        builder: (context, state) {
          if (state is ArticleSectionsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArticleSectionsLoaded) {
            return ListView.builder(
              padding:
                  EdgeInsets.all(HelperFunctions.screenWidth(context) * 0.05),
              itemCount: state.sections.length,
              itemBuilder: (context, index) {
                final section = state.sections[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(section.title ?? '',
                        style: index == 0
                            ? Theme.of(context).textTheme.headlineLarge
                            : Theme.of(context).textTheme.headlineMedium),
                    SizedBox(
                        height: HelperFunctions.screenWidth(context) * 0.03),
                    if (index == 0)
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(AssetsData.avatarImg),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rami Shaya',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              Text(
                                'November 18, 2021 | 4:20 PM',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    SizedBox(
                        height: HelperFunctions.screenWidth(context) * 0.06),
                    if (section.image != null)
                      CachedNetworkImg(
                        width: double.infinity,
                        img: section.image!,
                        placeHolder: AssetsData.placeHolderImg,
                        height: HelperFunctions.screenHeight(context) * 0.25,
                      ),
                    SizedBox(
                        height: HelperFunctions.screenWidth(context) * 0.06),
                    AutoSizeText(
                      section.content ?? '',
                      style: Theme.of(context).textTheme.bodyMedium,
                      minFontSize: 18,
                    ),
                    SizedBox(
                        height: HelperFunctions.screenWidth(context) * 0.06),
                    if (index + 1 == state.sections.length)
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.chat_bubble_outline),
                          Icon(Icons.favorite_border),
                          Icon(Icons.share),
                        ],
                      ),
                    const Divider(height: 32),
                  ],
                );
              },
            );
          } else if (state is ArticleSectionsFailure) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
