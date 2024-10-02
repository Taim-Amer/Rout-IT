import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/user/data/models/my_competitions_model.dart';
import 'package:route_it27/features/user/data/repo/user_repo.dart';

part 'my_competitions_state.dart';

class MyCompetitionsCubit extends Cubit<MyCompetitionsState> {
  MyCompetitionsCubit(this.userRepo) : super(MyCompetitionsInitial());
  final UserRepo userRepo;
  Future<void> fetchMyCompetitions() async {
    emit(MyCompetitionsLoading());
    var response = await userRepo.fetchMyCompetitions();
    response.fold(
        (failure) =>
            emit(MyCompetitionsFailure(errMessage: failure.errMessage)),
        (success) => emit(MyCompetitionsLoaded(myCompetitionModel: success)));
  }
}
