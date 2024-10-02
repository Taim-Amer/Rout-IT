import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/home/data/models/level_model.dart';
import 'package:route_it27/features/home/data/repo/home_repo.dart';

part 'level_state.dart';

class LevelCubit extends Cubit<LevelState> {
  LevelCubit({required this.homeRepo}) : super(LevelInitial());

  HomeRepo homeRepo;

  Future<void> fetchLevels({required int id}) async {
    emit(LevelLoading());
    var response = await homeRepo.fetchLevels(id: id );

    response.fold(
        (failure) =>
            emit(LevelFailure(errMessage: failure.errMessage)),
        (loadedLevels) =>
            emit(LevelLoaded(levels: loadedLevels)));
  }
}
