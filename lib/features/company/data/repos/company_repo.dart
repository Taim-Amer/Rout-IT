import 'package:dartz/dartz.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/features/company/data/models/company_profile_model.dart';

abstract class CompanyRepo {
  Future<Either<Failure, CompanyProfileModel>> fetchCompanyProfile(
      {required int companyId});
}
