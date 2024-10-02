import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/widgets/custom_button_item.dart';
import 'package:route_it27/core/widgets/custom_loading_item.dart';
import 'package:route_it27/core/widgets/custom_text_field_item.dart';
import 'package:route_it27/core/widgets/custom_toast.dart';
import 'package:route_it27/features/login/presentation/view_models/forget_password_cubit/forget_password_cubit.dart';

// ignore: must_be_immutable
class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          showToast(state.succesMessage, ToastState.SUCCESS);
          GoRouter.of(context)
              .pushReplacement(AppRouter.kResetPasswordCodeView , extra: emailController.text);
        } else if (state is ForgetPasswordFailure) {
          showToast("${state.failureMessage}\ncomplete your Register",
              ToastState.ERROR);
          GoRouter.of(context).push(AppRouter.kRegisterView);
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
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Forget Password",
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
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  // return 'Please Enter Your Email Address !';
                                  return '';
                                }
                                return null;
                              },
                              hint: "EMAIL",
                              prefix: Iconsax.message),
                          SizedBox(
                            height: size.height * .03,
                          ),
                          ConditionalBuilder(
                            condition: state is! ForgetPasswordLoading,
                            builder: (context) {
                              return CustomButtonItem(
                                textColor: AppColors.textOnPrimaryColor,
                                radius: 10,
                                backgroundColor: AppColors.darkPrimaryColor,
                                width: double.infinity,
                                height: size.height * 0.05,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<ForgetPasswordCubit>(
                                            context)
                                        .forgetPassword(
                                      emailController.text,
                                    );
                                  }
                                },
                                text: "Next",
                              );
                            },
                            fallback: (context) => const CustomLoadingItem(),
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
