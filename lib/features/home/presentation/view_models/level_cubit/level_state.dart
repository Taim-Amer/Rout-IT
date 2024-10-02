part of 'level_cubit.dart';

class LevelState extends Equatable {
  const LevelState();

  @override
  List<Object> get props => [];
}

class LevelInitial extends LevelState {}

class LevelLoading extends LevelState {}

class LevelLoaded extends LevelState {
  final List<LevelModel> levels;

  const LevelLoaded({required this.levels});
}

class LevelFailure extends LevelState {
  final String errMessage;

  const LevelFailure({required this.errMessage});
}
