import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/login/data/repos/login_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.loginRepo})
      : super(ForgetPasswordInitial());

  final LoginRepo loginRepo;

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    var finalResponse = await loginRepo.forgetPassword(email: email);

    finalResponse.fold(
        (failure) =>
            emit(ForgetPasswordFailure(failureMessage: failure.errMessage)),
        (success) =>
            emit(ForgetPasswordSuccess(succesMessage: success.message!)));
  }
}
