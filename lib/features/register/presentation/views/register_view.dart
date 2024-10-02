// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_button_item.dart';
import 'package:route_it27/core/widgets/custom_loading_item.dart';
import 'package:route_it27/core/widgets/custom_text_field_item.dart';
import 'package:route_it27/core/widgets/custom_divider_item.dart';
import 'package:route_it27/core/widgets/custom_text_button_item.dart';
import 'package:route_it27/core/widgets/custom_toast.dart';
import 'package:route_it27/features/login/presentation/view_models/password_visibility_cubit/password_visibility_cubit.dart';
import 'package:route_it27/features/register/presentation/view_models/register_cubit/register_cubit.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSucces) {
          CacheServices.saveData(
              key: "token", value: state.response.userWithToken!.token);
          showToast(state.response.message ?? "", ToastState.SUCCESS);

          GoRouter.of(context).push(AppRouter.kEmailVerificationView);
        } else if (state is RegisterFailure) {
          if (state.errMessage.contains("login")) {
            showToast(state.errMessage, ToastState.ERROR);
            GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
          }
          showToast(state.errMessage, ToastState.ERROR);
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
              ])),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.all(size.width * 0.07),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Create new Account",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: size.height * .05,
                          ),
                          CustomTextFieldItem(
                              controller: nameController,
                              type: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  // return 'First name must not be empty !';
                                  return "";
                                }
                                return null;
                              },
                              hint: "NAME",
                              prefix: Iconsax.user),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          CustomTextFieldItem(
                              controller: emailController,
                              type: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  // return 'Last name must not be empty !';
                                  return '';
                                }
                                return null;
                              },
                              hint: "Email",
                              prefix: Iconsax.personalcard),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          BlocBuilder<PasswordVisibilityCubit,
                                  PasswordVisibilityState>(
                              builder: (context, state) => CustomTextFieldItem(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        // return 'Password is too Short !';
                                        return '';
                                      }
                                      return null;
                                    },
                                    hint: "Password",
                                    prefix: Iconsax.lock,
                                    suffix: PasswordVisibilityCubit.get(context)
                                        .suffix,
                                    suffixPressed: () {
                                      PasswordVisibilityCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    isPassword:
                                        PasswordVisibilityCubit.get(context)
                                            .isPassword,
                                  )),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          BlocBuilder<PasswordVisibilityCubit,
                                  PasswordVisibilityState>(
                              builder: (context, state) => CustomTextFieldItem(
                                    controller: confirmationPasswordController,
                                    type: TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        // return 'Password is too Short !';
                                        return '';
                                      }
                                      return null;
                                    },
                                    hint: "Password Confirmation",
                                    prefix: Iconsax.lock,
                                    suffix: PasswordVisibilityCubit.get(context)
                                        .suffix,
                                    suffixPressed: () {
                                      PasswordVisibilityCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    isPassword:
                                        PasswordVisibilityCubit.get(context)
                                            .isPassword,
                                  )),
                          SizedBox(
                            height: size.height * .03,
                          ),
                          ConditionalBuilder(
                            condition: state is! RegisterLoading,
                            builder: (context) {
                              return CustomButtonItem(
                                textColor: AppColors.textOnPrimaryColor,
                                radius: 10,
                                backgroundColor: AppColors.darkPrimaryColor,
                                width: double.infinity,
                                height: size.height * 0.05,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<RegisterCubit>(context)
                                        .register(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            passpasswordConfirmation:
                                                confirmationPasswordController
                                                    .text);
                                  }
                                },
                                text: "Next",
                              );
                            },
                            fallback: (context) => const CustomLoadingItem(),
                          ),
                          SizedBox(
                            height: size.height * .04,
                          ),
                          const CustomDividerItem(),
                          SizedBox(
                            height: size.height * .02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Have an Account?',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              SizedBox(width: size.width * .01),
                              CustomTextButtonItem(
                                function: () {
                                  GoRouter.of(context)
                                      .pushReplacement(AppRouter.kLoginView);
                                },
                                text: 'login',
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
