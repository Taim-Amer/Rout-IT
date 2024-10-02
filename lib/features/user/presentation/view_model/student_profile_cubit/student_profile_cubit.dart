import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_it27/features/user/data/models/student_profile_model.dart';
import 'package:route_it27/features/user/data/repo/user_repo.dart';

part 'student_profile_state.dart';

class StudentProfileCubit extends Cubit<StudentProfileState> {
  StudentProfileCubit({required this.studentProfileRepo}) : super(StudentProfileInitial());

  static StudentProfileCubit get(context) => BlocProvider.of(context);

  final UserRepo studentProfileRepo;

  Future<void> fetchStudentProfile({required int id}) async {
    emit(StudentProfileLoading());
    var finalResponse = await studentProfileRepo.fetchStudentProfile(id: id);

    finalResponse.fold(
            (failure) => emit(StudentProfileFailure(failure.errMessage)),
            (success) => emit(StudentProfileSuccess(success))
    );
  }
}
