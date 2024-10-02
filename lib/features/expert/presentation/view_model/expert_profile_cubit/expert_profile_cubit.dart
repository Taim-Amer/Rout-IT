import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_it27/features/expert/data/models/expert_profile_model.dart';
import 'package:route_it27/features/expert/data/repo/expert_profile_repo.dart';

part 'expert_profile_state.dart';

class ExpertProfileCubit extends Cubit<ExpertProfileState> {
  ExpertProfileCubit({required this.expertProfileRepo}) : super(ExpertProfileInitial());

  static ExpertProfileCubit get(context) => BlocProvider.of(context);

  final ExpertProfileRepo expertProfileRepo;

  Future<void> fetchExpertProfile({required int id}) async {
    emit(ExpertProfileLoading());
    var finalResponse = await expertProfileRepo.fetchExpertProfile(id: id);

    finalResponse.fold(
            (failure) => emit(ExpertProfileFailure(failure.errMessage)),
            (success) => emit(ExpertProfileSuccess(success))
    );
  }
}
