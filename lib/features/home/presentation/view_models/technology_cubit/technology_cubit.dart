import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:route_it27/features/home/data/models/technologies_model.dart';
import 'package:route_it27/features/home/data/repo/home_repo.dart';

part 'technology_state.dart';

class TechnologyCubit extends Cubit<TechnologyState> {
  TechnologyCubit({required this.homeRepo}) : super(TechnologyInitial());

  HomeRepo homeRepo;

  Future<void> fetchAllTechologies({required int id}) async {
    emit(TechnologyLoading());
    var response = await homeRepo.fetchTechnologies(id: id);

    response.fold(
      (failure) {
        emit(TechnologyFailure(errMessage: failure.errMessage));
      },
      (success) {
        emit(TechnologySuccess(technologiesModel: success));
      },
    );
  }
}
