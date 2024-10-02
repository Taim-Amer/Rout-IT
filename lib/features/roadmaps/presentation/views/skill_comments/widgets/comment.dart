import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.username,
    required this.comment,
    required this.image,
    required this.context,
  });

  final String username;
  final String comment;
  final String image;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: ClipOval(
              child: image.contains("cache")
                  ? Image.file(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      File(image),
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Text('Error loading image');
                      },
                    )
                  : CachedNetworkImage(
                      imageUrl: imageUrl + image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
            ),
          ),
          SizedBox(width: HelperFunctions.screenWidth(context) * 0.02),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  comment,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
