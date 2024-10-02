import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart'; // Package to format date and time

class CompetitionTimeWidget extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;

  const CompetitionTimeWidget({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedStartDate =
        DateFormat('MMM dd, yyyy').format(startDate);
    final String formattedStartTime = DateFormat('hh:mm a').format(startDate);
    final String formattedEndDate = DateFormat('MMM dd, yyyy').format(endDate);
    final String formattedEndTime = DateFormat('hh:mm a').format(endDate);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.white, size: 24),
              SizedBox(width: 10),
              Text(
                "Competition Duration",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
            thickness: 1,
            color: Colors.grey,
          ),
          _buildDateTimeRow(
            context: context,
            label: "Start Date",
            date: formattedStartDate,
            time: formattedStartTime,
            icon: Icons.play_arrow,
          ),
          const SizedBox(height: 10),
          _buildDateTimeRow(
            context: context,
            label: "End Date",
            date: formattedEndDate,
            time: formattedEndTime,
            icon: Icons.stop,
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeRow({
    required BuildContext context,
    required String label,
    required String date,
    required String time,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
