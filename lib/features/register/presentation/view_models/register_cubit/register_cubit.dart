import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/features/register/data/models/register_model.dart';
import 'package:route_it27/features/register/data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  final RegisterRepo registerRepo;

  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required String passpasswordConfirmation}) async {
    emit(RegisterLoading());
    var finalResponse = await registerRepo.register(
        name: name,
        email: email,
        password: password,
        passpasswordConfirmation: passpasswordConfirmation);

    finalResponse.fold((failure) {
      print("we are printing in the register cubitttt");
      print(failure.errMessage);
      emit(RegisterFailure(errMessage: failure.errMessage));
    }, (success) => emit(RegisterSucces(response: success)));
  }
}
