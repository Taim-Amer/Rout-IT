part of 'student_profile_cubit.dart';

@immutable
class StudentProfileState extends Equatable {
  const StudentProfileState();
  @override
  List<Object?> get props => [];
}

class StudentProfileInitial extends StudentProfileState {}

class StudentProfileLoading extends StudentProfileState {}

class StudentProfileFailure extends StudentProfileState {
  final String errMessage;
  const StudentProfileFailure(this.errMessage);
}

class StudentProfileSuccess extends StudentProfileState {
  final StudentProfileModel info;
  const StudentProfileSuccess(this.info);
}
