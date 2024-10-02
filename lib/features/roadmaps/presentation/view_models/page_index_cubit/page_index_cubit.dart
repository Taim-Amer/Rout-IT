import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class PageIndexCubit extends Cubit<int> {
  PageIndexCubit() : super(0);
 final PageController pageController = PageController();
  void setPageIndex(int index) => emit(index);
   @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}

