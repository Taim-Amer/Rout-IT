import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';

class CustomExpandableText extends StatelessWidget {
  final String? content;

  CustomExpandableText({
    super.key,
    required this.content,
  });

  final ValueNotifier<bool> expanded = ValueNotifier(false);
  final int maxLinesToShow = 2;

  @override
  Widget build(BuildContext context) {
    final TextSpan textSpan = TextSpan(
      text: content ?? "",
      style: const TextStyle(
        // fontStyle: FontStyle.normal,
        fontWeight: MyTextStyles.textWeight,
        fontSize: 16.0,
      ),
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      maxLines: expanded.value ? null : maxLinesToShow,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

    final int numberOfLines = textPainter.computeLineMetrics().length;
    return ValueListenableBuilder(
      valueListenable: expanded,
      builder: (context, values, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (!expanded.value && numberOfLines >= maxLinesToShow) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content ?? "",
                        maxLines: maxLinesToShow,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      /* See More :: type 1 - See More | 2 - See Less */
                      SeeMoreLessWidget(
                        textData: 'See More',
                        type: 1,
                        section: 1,
                        onSeeMoreLessTap: () {
                          expanded.value = true;
                        },
                      ),
                      /* See More :: type 1 - See More | 2 - See Less */
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content ?? "",
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      if (expanded.value && numberOfLines >= maxLinesToShow)
                        /* See Less :: type 1 - See More | 2 - See Less */
                        SeeMoreLessWidget(
                          textData: 'See Less',
                          type: 2,
                          section: 1,
                          onSeeMoreLessTap: () {
                            expanded.value = false;
                          },
                        ),
                      /* See Less :: type 1 - See More | 2 - See Less */
                    ],
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class SeeMoreLessWidget extends StatelessWidget {
  final String? textData;
  final int? type; /* type 1 - See More | 2 - See Less */
  final Function? onSeeMoreLessTap;
  final int?
      section; /* 1: About the course | 2 - Who can take up this course? | 3 - Mentors | 4 - Course Video Reviews */

  const SeeMoreLessWidget({
    super.key,
    required this.textData,
    required this.type,
    required this.onSeeMoreLessTap,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: InkWell(
          onTap: () {
            if (onSeeMoreLessTap != null) {
              onSeeMoreLessTap!();
            }
          },
          child: Text.rich(
            softWrap: true,
            style: const TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: AppColors.lightPrimaryColor,
            ),
            textAlign: TextAlign.start,
            TextSpan(
              text: "",
              children: [
                TextSpan(
                  text: textData,
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
                const WidgetSpan(
                  child: SizedBox(
                    width: 3.0,
                  ),
                ),
                WidgetSpan(
                  child: Icon(
                    (type == 1)
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: AppColors.lightPrimaryColor,
                    size: 17.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
