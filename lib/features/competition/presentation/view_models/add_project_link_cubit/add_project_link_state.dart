part of 'add_project_link_cubit.dart';

sealed class AddProjectLinkState extends Equatable {
  const AddProjectLinkState();

  @override
  List<Object> get props => [];
}

class AddProjectLinkInitial extends AddProjectLinkState {}

class AddProjectLinkLoading extends AddProjectLinkState {}

class AddProjectLinkSuccess extends AddProjectLinkState {
  final ProjectLinkModel projectLinkModel;

  const AddProjectLinkSuccess({required this.projectLinkModel});
}

class AddProjectLinkFailure extends AddProjectLinkState {
  final String errMessage;

  const AddProjectLinkFailure({required this.errMessage});
}
