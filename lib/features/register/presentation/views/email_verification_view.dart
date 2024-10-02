import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/widgets/custom_back_button.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_button_item.dart';
import 'package:route_it27/core/widgets/custom_loading_item.dart';
import 'package:route_it27/core/widgets/custom_toast.dart';
import 'package:route_it27/features/register/presentation/view_models/email_verification_cubit/email_verification_code_cubit.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({super.key});

  @override
  State<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends State<EmailVerificationView> {
  int otbCode = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<EmailVerificationCodeCubit, EmailVerificationCodeState>(
      listener: (context, state) {
        if (state is EmailVerificationCodeSucces) {
          showToast("${state.succesMessage}\n", ToastState.SUCCESS);
          GoRouter.of(context).pushReplacement(AppRouter.kCompleteRegisterView);
        } else if (state is EmailVerificationCodeFailure) {
          showToast("${state.failureMessage}\n try enter your Email Again",
              ToastState.ERROR);
          GoRouter.of(context).pushReplacement(AppRouter.kRegisterView);
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
              AppColors.  darkPrimaryColor,
              AppColors.  primaryColor,
               AppColors. secondaryColor2,
              ])),
          child: Scaffold(
            appBar: AppBar(
              clipBehavior: Clip.antiAlias,
              surfaceTintColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              leading: const CustomBackButton2(),
            ),
            body: Padding(
                                  padding:  EdgeInsets.all(
                        size.width*0.07),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "CO\nDE",
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Verification".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      const Text(
                        "Enter the Verification Code you recived in your email ",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      OtpTextField(
                        onSubmit: (code) {
                          setState(() {
                            otbCode = int.parse(code);
                          });
                        },
                        numberOfFields: 6,
                        fillColor:AppColors. lightPrimaryColor.withOpacity(0.1),
                        filled: true,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      ConditionalBuilder(
                        condition: state is! EmailVerificationCodeLoading,
                        builder: (context) {
                          return CustomButtonItem(
                            textColor: AppColors.textOnPrimaryColor,
                            radius: 10,
                            backgroundColor: AppColors.darkPrimaryColor,
                            width: double.infinity,
                            height: size.height * 0.05,
                            function: () {
                              BlocProvider.of<EmailVerificationCodeCubit>(
                                      context)
                                  .checkEmailVerificationCode(code: otbCode);
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
          ),
        );
      },
    );
  }
}
