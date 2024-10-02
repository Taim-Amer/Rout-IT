part of 'followd_companies_cubit.dart';

@immutable
abstract class FollowedCompaniesState {}

class FollowedCompaniesInitial extends FollowedCompaniesState {}

class FollowedCompaniesLoading extends FollowedCompaniesState {}

class FollowedCompaniesSuccess extends FollowedCompaniesState {
  final FollowedCompaniesModel followedCompaniesModel;
  FollowedCompaniesSuccess(this.followedCompaniesModel);
}

class FollowedCompaniesFailure extends FollowedCompaniesState {
  final String errMessage;
  FollowedCompaniesFailure(this.errMessage);

}
