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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
    border: Border.all(color: AppColors.whiteColor.withOpacity(0.5))
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
            color: AppColors.whiteColor, fontStyle: FontStyle.normal),
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: "Enter your birthdate",
          hintStyle: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor,
              fontStyle: FontStyle.normal,
              fontSize: 15),
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.parse('2007-01-01'),
            firstDate: DateTime.parse('1980-01-01'),
            lastDate: DateTime.parse('2007-12-30'),
          );
          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

            dateController.text = formattedDate;
            print("${dateController.text} this is our time ");
          }
        },
      ),
    );
  }
}
