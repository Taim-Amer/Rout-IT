import 'package:dartz/dartz.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/features/expert/data/models/expert_profile_model.dart';

abstract class ExpertProfileRepo {
  Future<Either<Failure, ExpertProfileModel>> fetchExpertProfile({required int id});
}