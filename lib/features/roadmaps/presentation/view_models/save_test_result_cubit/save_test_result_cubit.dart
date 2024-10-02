import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:route_it27/features/roadmaps/data/repos/roadmap_repo.dart';

part 'save_test_result_state.dart';

class SaveTestResultCubit extends Cubit<SaveTestResultState> {
  SaveTestResultCubit({required this.roadMapRepo})
      : super(SaveTestResultInitial());

  final RoadMapRepo roadMapRepo;
  Future<void> saveTestResult(
      {required int testId, required bool isPassed}) async {
    var finalResponse =
        await roadMapRepo.saveTestResult(testId: testId, isPassed: isPassed);
    finalResponse.fold(
        (failure) =>
            emit(SaveTestResultFailure(errMessage: failure.errMessage)),
        (success) =>
            emit(SaveTestResultSuccess(successMessage: success.message!)));
  }
}
