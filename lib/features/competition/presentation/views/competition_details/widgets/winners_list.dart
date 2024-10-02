import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/constants/constants_numbers.dart';
import 'package:route_it27/core/utils/helpers/helper_functions.dart';
import 'package:route_it27/features/competition/presentation/view_models/winners_cubit/winners_cubit.dart';

class WinnersList extends StatelessWidget {
  const WinnersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WinnersCubit, WinnersState>(
      builder: (context, state) {
        if (state is WinnersLoaded) {
          final winners = state.winnersModel.winners!;
          return Padding(
            padding: EdgeInsets.all(
                HelperFunctions.screenWidth(context) * horizintalMargin),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white, width: 0.5),
              ),
              child: Table(
                columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: winners.map((winner) {
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 12.0),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: AppColors.secondaryColor,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              imageUrl+
                              winner.image! 
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              winner.name ?? 'Unknown',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              winner.university ?? 'Unknown University',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.1),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Text(
                                'Rank: ${winner.rank}',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        } else if (state is WinnersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text(
              "No winners yet",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );
  }
}
