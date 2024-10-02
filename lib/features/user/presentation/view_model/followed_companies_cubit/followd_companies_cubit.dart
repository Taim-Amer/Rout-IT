import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:route_it27/features/user/data/models/followed_companies_model.dart';
import 'package:route_it27/features/user/data/repo/user_repo.dart';

part 'followd_companies_state.dart';

class FollowedCompaniesCubit extends Cubit<FollowedCompaniesState> {
  FollowedCompaniesCubit({required this.followedCompaniesRepo}) : super(FollowedCompaniesInitial());

  static FollowedCompaniesCubit get(context) => BlocProvider.of(context);

  final UserRepo followedCompaniesRepo;

  Future<void> showFollowedCompanies({required int id}) async {
    emit(FollowedCompaniesLoading());

    var finalResponse = await followedCompaniesRepo.showFollowedCompanies(id: id);

    finalResponse.fold(
        (failure) => emit(FollowedCompaniesFailure(failure.errMessage)),
        (success) => emit(FollowedCompaniesSuccess(success)),
    );
  }


}
