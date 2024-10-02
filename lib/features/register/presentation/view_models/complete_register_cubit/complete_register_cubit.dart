import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/register/data/repo/register_repo.dart';

part 'complete_register_state.dart';

class CompleteRegisterCubit extends Cubit<CompleteRegisterState> {
  CompleteRegisterCubit({required this.registerRepo})
      : super(CompleteRegisterInitial());

  final RegisterRepo registerRepo;

  Future<void> completeRegister(
      {required File profileImage,
      required String birthDate,
      required String isItStudent,
      required String university,
      required String bio}) async {
    emit(CompleteRegisterLoading());
    var finalResponse = await registerRepo.completeRegister(
        profileImage: profileImage,
        birthDate: birthDate,
        isItStudent: isItStudent,
        university: university,
        bio: bio);
    finalResponse.fold(
        (failure) =>
            emit(CompleteRegisterFailure(failureMessage: failure.errMessage)),
        (succes) =>
            emit(CompleteRegisterSucces(succesMessage: succes.message!)));
  }
}
