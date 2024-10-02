import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/core/utils/dio/api_services.dart';
import 'package:route_it27/core/utils/local_storage/cache_services.dart';
import 'package:route_it27/features/register/data/models/complete_register_model.dart';
import 'package:route_it27/features/register/data/models/register_model.dart';
import 'package:route_it27/features/register/data/models/verification_code.dart';
import 'package:route_it27/features/register/data/repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiService apiService;

  RegisterRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, RegisterModel>> register(
      {required String name,
      required String email,
      required String password,
      required String passpasswordConfirmation}) async {
    try {
      var data = await apiService.post(endpoint: "register", data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passpasswordConfirmation
      });

      RegisterModel response = RegisterModel.fromJson(data);
      // ignore: avoid_print
      print("we registered sucessfuly${response.message}");
      CacheServices.saveData(
          key: "user_id", value: response.userWithToken!.userId);

                CacheServices.saveData(
          key: "token", value: response.userWithToken!.token);

      CacheServices.saveData(
          key: "userName", value: response.userWithToken!.name);

      return (Right(response));
    } catch (e) {
      print("error in register repository${e}");
      if (e is DioException) {
        if (e.response!.statusCode == 409) {
          return Left(
              ServerFailure("You already have an account. Please login"));
        }
        return (Left(ServerFailure.fromDioError(e)));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, VerificationCodeModel>> checkEmailVerificationCode(
      {required int verificationCode}) async {
    try {
      var data = await apiService.post(
          endpoint: "checkEmailVerificationCode",
          data: {"code": verificationCode},
          bearerToken: CacheServices.getData(key: "token"));

      VerificationCodeModel response = VerificationCodeModel.fromJson(data);
      print(
          "${response.message} :  user is varifing its email and it is scuccess");
      print("this is the token : ${CacheServices.getData(key: "token")} ");

      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CompleteRegisterModel>> completeRegister(
      {required File profileImage,
      required String birthDate,
      required String isItStudent,
      required String university,
      required String bio}) async {
    try {
      String imageName = profileImage.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(profileImage.path,
            filename: imageName),
        "birth_date": birthDate,
        "it_student": isItStudent,
        "university": university,
        "bio": bio,
      });
      var data = await apiService.post(
          endpoint: "completeRegister",
          data: formData,
          bearerToken: CacheServices.getData(key: "token"));

      CompleteRegisterModel response = CompleteRegisterModel.fromJson(data);

      return Right(response);
    } catch (e) {
      // ignore: avoid_print
      print("error in the complete Register Repository$e");
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
