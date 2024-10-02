import 'package:dartz/dartz.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/features/login/data/models/forget_password_model.dart';
import 'package:route_it27/features/login/data/models/login_model.dart';
import 'package:route_it27/features/login/data/models/reset_password_code_model.dart';
import 'package:route_it27/features/login/data/models/reset_password_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> login(
      {required String email, required String password});
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
      {required String email});
  Future<Either<Failure, ResetPasswordCodeModel>> resetPasswordCode(
      {required String email, required int otbCode});
  Future<Either<Failure, ResetPasswordModel>> resetPassword(
      {required String email,
      required String password,
      required String passwordConfirmation});
}
