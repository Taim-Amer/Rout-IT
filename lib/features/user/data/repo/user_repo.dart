import 'package:dartz/dartz.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/features/user/data/models/followed_companies_model.dart';
import 'package:route_it27/features/user/data/models/followed_experts_model.dart';
import 'package:route_it27/features/user/data/models/followed_technologies_model.dart';
import 'package:route_it27/features/user/data/models/my_competitions_model.dart';
import 'package:route_it27/features/user/data/models/my_profile_model.dart';
import 'package:route_it27/features/user/data/models/student_profile_model.dart';
import 'package:route_it27/features/user/data/models/toggle_follow_company_model.dart';
import 'package:route_it27/features/user/data/models/toggle_follow_expert_model.dart';
import 'package:route_it27/features/user/data/models/toggle_follow_technology_model.dart';

abstract class UserRepo {
  Future<Either<Failure, StudentProfileModel>> fetchStudentProfile({required int id});
  Future<Either<Failure, FollowedExpertsModel>> showFollowedExperts({required int id});
  Future<Either<Failure, FollowedTechnologiesModel>> showFollowedTechnologies({required int id});
  Future<Either<Failure, FollowedCompaniesModel>> showFollowedCompanies({required int id});
  Future<Either<Failure, ToggleFollowExpertModel>> toggleFollowExpert({required int id});
  Future<Either<Failure, ToggleFollowTechnologyModel>> toggleFollowTechnology({required int id});
  Future<Either<Failure, ToggleFollowCompanyModel>> toggleFollowCompany({required int id});

  Future<Either<Failure, MyProfile>> fetchProfile();

  Future<Either<Failure, MyCompetitionModel>> fetchMyCompetitions();
}