part of 'comments_cubit.dart';

class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<Comments> comments;

  const CommentsLoaded({required this.comments});
  
}

class CommentsFailure extends CommentsState {
    final String errMessage;

  const CommentsFailure({required this.errMessage});
}
