part of 'add_comment_cubit.dart';

class AddCommentState extends Equatable {
  const AddCommentState();

  @override
  List<Object> get props => [];
}

class AddCommentInitial extends AddCommentState {}

class AddCommentLLoading extends AddCommentState {}

class AddCommentLoaded extends AddCommentState {
  
}

class AddCommentFailure extends AddCommentState {
  final String errMessage;

  const AddCommentFailure({required this.errMessage});

}
