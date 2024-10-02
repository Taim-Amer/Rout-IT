// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'skill_nav_bar_cubit.dart';


class SkillNavBarState extends Equatable {
  final int tabIndex;
  const SkillNavBarState(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}

class SkillNavBarInitial extends SkillNavBarState {
  const SkillNavBarInitial(super.tabIndex);
}