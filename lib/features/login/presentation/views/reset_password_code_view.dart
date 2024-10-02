import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/router/app_router.dart';
import 'package:route_it27/core/widgets/custom_back_button2.dart';
import 'package:route_it27/core/widgets/custom_button_item.dart';
import 'package:route_it27/core/widgets/custom_loading_item.dart';
import 'package:route_it27/core/widgets/custom_text_field_item.dart';
import 'package:route_it27/core/widgets/custom_toast.dart';
import 'package:route_it27/features/login/presentation/view_models/reset_password_codecubit/reset_password_code_cubit.dart';

class ResetPasswordCodeView extends StatefulWidget {
  const ResetPasswordCodeView({super.key , required this.email});
  final String email;

  @override
  State<ResetPasswordCodeView> createState() => _ResetPasswordCodeViewState();
}

class _ResetPasswordCodeViewState extends State<ResetPasswordCodeView> {
  int otbCode = 0;
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<ResetPasswordCodeCubit, ResetPasswordCodeState>(
      listener: (context, state) {
        if (state is ResetPasswordCodeSuccess) {
          showToast("${state.message}\n", ToastState.SUCCESS);
          // //! navigate to set new password screen
          GoRouter.of(context).pushReplacement(AppRouter.kResetPasswordView ,extra: widget.email);
        } else if (state is ResetPasswordCodeFailure) {
          if (state.message.contains("Wrong")) {
            showToast("Wrong Reset Password Code.", ToastState.ERROR);
          }
          showToast("${state.message}\n try enter your Email Again",
              ToastState.ERROR);
          GoRouter.of(context).pushReplacement(AppRouter.kForgetPasswordView , );
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
               AppColors. darkPrimaryColor,
               AppColors. primaryColor,
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
              padding: EdgeInsets.all(size.width * 0.07),
              child: Form(
                key: formKey,
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
                          condition: state is! ResetPasswordCodeLoading,
                          builder: (context) {
                            return CustomButtonItem(
                              textColor:AppColors. textOnPrimaryColor,
                              radius: 10,
                              backgroundColor: AppColors.darkPrimaryColor,
                              width: double.infinity,
                              height: size.height * 0.05,
                              function: () {
                                BlocProvider.of<ResetPasswordCodeCubit>(context)
                                    .resetPasswordCode(
                                        email: widget.email,
                                        otbCode: otbCode);
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
          ),
        );
      },
    );
  }
}
