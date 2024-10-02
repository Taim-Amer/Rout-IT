import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/company/data/models/company_profile_model.dart';
import 'package:route_it27/features/company/data/repos/company_repo.dart';

part 'company_profile_state.dart';

class CompanyProfileCubit extends Cubit<CompanyProfileState> {
  CompanyProfileCubit(this.companyRepo) : super(CompanyProfileInitial());
  final CompanyRepo companyRepo;

  Future<void> fetchCompanyProfile({required int companyId}) async {
    emit(CompanyProfileLoading());
    final response =
        await companyRepo.fetchCompanyProfile(companyId: companyId);
    response.fold(
        (faliure) =>
            emit(CompanyProfileFailure(errMessage: faliure.errMessage)),
        (success) => emit(CompanyProfileLoaded(companyProfileModel: success)));
  }
}
