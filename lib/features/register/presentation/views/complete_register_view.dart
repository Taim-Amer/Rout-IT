import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/utils/styles/app_styles.dart';
import 'package:route_it27/core/utils/constants/assets_data.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_button_item.dart';
import 'package:route_it27/core/widgets/custom_loading_item.dart';
import 'package:route_it27/core/widgets/custom_outlined_text_field.dart';
import 'package:route_it27/core/widgets/custom_toast.dart';
import 'package:route_it27/features/register/presentation/view_models/complete_register_cubit/complete_register_cubit.dart';
import 'package:route_it27/features/register/presentation/view_models/image_picker_cubit/image_picker_cubit.dart';
import 'package:route_it27/features/register/presentation/views/custom_date_picker.dart';

class CompleteRegisterView extends StatefulWidget {
  const CompleteRegisterView({super.key});

  @override
  _CompleteRegisterViewState createState() => _CompleteRegisterViewState();
}

class _CompleteRegisterViewState extends State<CompleteRegisterView> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController universityController = TextEditingController();

  final List<String> universities = [
    'Damascus University',
    'Aleppo University',
    'Tishreen University',
    'Al-Baath University',
    'Hama University',
    'Idlib University',
    'Homs University',
  ];

  @override
  void dispose() {
    dateController.dispose();
    bioController.dispose();
    universityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocConsumer<CompleteRegisterCubit, CompleteRegisterState>(
      listener: (context, state) {
        if (state is CompleteRegisterSucces) {
          showToast(state.succesMessage, ToastState.SUCCESS);
          // ignore: avoid_print
         
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else if (state is CompleteRegisterFailure) {
          showToast(state.failureMessage, ToastState.ERROR);
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.darkPrimaryColor,
                AppColors.primaryColor,
                AppColors.secondaryColor2,
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text(
                "Complete Register",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MyTextStyles.titleSize,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leading: const CustomBackButton2(),
            ),
            body: BlocBuilder<ImagePickerCubit, ImagePickerState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              BlocProvider.of<ImagePickerCubit>(context)
                                  .pickImage(),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CircleAvatar(
                                  radius: 64.0,
                                  backgroundColor: Colors.blue,
                                  backgroundImage: state is ImagePickerSuccess
                                      ? FileImage(state.image)
                                          as ImageProvider<Object>
                                      : const AssetImage(AssetsData.avatarImg)
                                          as ImageProvider<Object>),
                              const CircleAvatar(
                                radius: 12,
                                backgroundColor: AppColors.primaryColor,
                                child: Icon(Icons.edit,
                                    size: 14, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * .03),
                        CustomDatePicker(dateController: dateController),
                        SizedBox(height: size.height * .03),
                        DropdownButtonFormField<String>(
                          dropdownColor: AppColors.secondaryColor,
                          decoration: const InputDecoration(
                            labelText: "Select University",
                            border: OutlineInputBorder(),
                          ),
                          items: universities
                              .map((university) => DropdownMenuItem<String>(
                                    value: university,
                                    child: Text(university),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            universityController.text = value ?? '';
                          },
                        ),
                        SizedBox(height: size.height * .03),
                        CustomOutlinedTextField(
                          controller: bioController,
                          hintText: 'Enter your bio',
                        ),
                        SizedBox(height: size.height * .03),
                        ConditionalBuilder(
                          condition:
                              BlocProvider.of<CompleteRegisterCubit>(context)
                                  .state is! CompleteRegisterLoading,
                          builder: (context) {
                            return CustomButtonItem(
                              textColor: AppColors.textOnPrimaryColor,
                              radius: 10,
                              backgroundColor: AppColors.darkPrimaryColor,
                              width: double.infinity,
                              height: size.height * 0.07,
                              function: () {
                                print("fffffffffffffffffffffffffffffff");
                                print("this  is our user id ${CacheServices.getData(key: "user_id")}");
                                BlocProvider.of<CompleteRegisterCubit>(context)
                                    .completeRegister(
                                  profileImage:
                                      BlocProvider.of<ImagePickerCubit>(context)
                                              .state is ImagePickerSuccess
                                          ? (BlocProvider.of<ImagePickerCubit>(
                                                      context)
                                                  .state as ImagePickerSuccess)
                                              .image
                                          : File(""),
                                  birthDate: dateController.text,
                                  isItStudent: "1",
                                  university: universityController.text,
                                  bio: bioController.text,
                                );
                              },
                              text: "Complete Register",
                            );
                          },
                          fallback: (context) => const CustomLoadingItem(),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
