part of 'company_profile_cubit.dart';

class CompanyProfileState extends Equatable {
  const CompanyProfileState();

  @override
  List<Object> get props => [];
}

class CompanyProfileInitial extends CompanyProfileState {}

class CompanyProfileLoading extends CompanyProfileState {}

class CompanyProfileLoaded extends CompanyProfileState {
  final CompanyProfileModel companyProfileModel;

  const CompanyProfileLoaded({required this.companyProfileModel});
}

class CompanyProfileFailure extends CompanyProfileState {
  final String errMessage;

  const CompanyProfileFailure({required this.errMessage});
}
