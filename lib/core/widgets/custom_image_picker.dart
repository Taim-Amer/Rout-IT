// // ignore_for_file: must_be_immutable
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:route_it/core/utils/assets_data.dart';
// import 'package:route_it/features/register/presentation/view_models/image_picker_cubit/image_picker_cubit.dart';

// class CustomImagePicker extends StatelessWidget {
//   const CustomImagePicker({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return BlocBuilder<ImagePickerCubit, ImagePickerState>(
//       builder: (context, state) {
//         return Center(
//           child: GestureDetector(
//             onTap: () {
//               ImagePickerCubit.get(context).pickImageFromGallery();
//             },
//             child: ClipOval(
//               child: SizedBox(
//                 height: 200,
//                 width: 200,
//                 child: Image.file(
//                     ImagePickerCubit.get(context).selectedImage ?? File(AssetsData.profileImg),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
