import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'skill_nav_bar_state.dart';

class SkillNavBarCubit extends Cubit<SkillNavBarState> {
  SkillNavBarCubit() : super(const SkillNavBarInitial(0));

  void tabChange(int tabIndex) {
    emit(SkillNavBarInitial(tabIndex));
  }
}