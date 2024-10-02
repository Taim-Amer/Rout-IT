part of 'winners_cubit.dart';

class WinnersState extends Equatable {
  const WinnersState();

  @override
  List<Object> get props => [];
}

class WinnersInitial extends WinnersState {}

class WinnersLoaded extends WinnersState {
  final WinnersModel winnersModel;

  const WinnersLoaded({required this.winnersModel});
}

class WinnersFailure extends WinnersState {
  final String errMessage;

  const WinnersFailure({required this.errMessage});
}

class WinnersLoading extends WinnersState {}
