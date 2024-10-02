// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key, required this.dateController});

  final TextEditingController dateController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withOpacity(0.3),
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: TextField(
        controller: dateController,
        keyboardType: TextInputType.none,
        textAlign: TextAlign.center,
        showCursor: false,
        enableInteractiveSelection: false,
        cursorColor: Colors.transparent,
        cursorErrorColor: Colors.transparent,
        style: const TextStyle(
            color: AppColors.lightPrimaryColor, fontStyle: FontStyle.normal),
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: "Enter your birthdate",
          hintStyle: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontSize: 15),
        ),
        onTap: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.parse('2007-01-01'),
            firstDate: DateTime.parse('1980-01-01'),
            lastDate: DateTime.parse('2007-12-30'),
          ).then((value) {
            // print(DateFormat.yMMMd().format(value!));
            dateController.text = DateFormat.yMMMd().format(value!);
          });
        },
      ),
    );
  }
}
