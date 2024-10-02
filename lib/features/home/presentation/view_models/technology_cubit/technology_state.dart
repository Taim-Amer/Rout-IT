part of 'technology_cubit.dart';

@immutable
class TechnologyState extends Equatable {
  const TechnologyState();

  @override
  List<Object> get props => [];
}

class TechnologyInitial extends TechnologyState {}
class TechnologyLoading extends TechnologyState{}

class TechnologySuccess extends TechnologyState {
  final List<TechnologiesModel> technologiesModel;

  const TechnologySuccess({required this.technologiesModel});
}

class TechnologyFailure extends TechnologyState {
  final String errMessage;

  const TechnologyFailure({required this.errMessage});
}
