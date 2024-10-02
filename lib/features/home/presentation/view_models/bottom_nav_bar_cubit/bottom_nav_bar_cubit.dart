import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarInitial(tabIndex: 0));

  void tabChange(int tabIndex) {
    emit(BottomNavBarInitial(tabIndex: tabIndex));
  }
}
