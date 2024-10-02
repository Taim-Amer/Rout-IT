import 'package:dartz/dartz.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/features/competition/data/models/add_project_link_model.dart';
import 'package:route_it27/features/competition/data/models/competition_model.dart';
import 'package:route_it27/features/competition/data/models/competitor_models.dart';
import 'package:route_it27/features/competition/data/models/register_competition.dart';
import 'package:route_it27/features/competition/data/models/winners_model.dart';

abstract class CompetitionRepo {
  Future<Either<Failure, List<Competitions>>> fetchCompetitions(
      {required String competitionState});
  Future<Either<Failure, RegisterCompetition>> registerCompetition(
      {required int competitionId});

  Future<Either<Failure, List<Competitor>>> fetchAllCompetitors(
      {required int competitionId});
  Future<Either<Failure, ProjectLinkModel>> addProjectLink(
      {required int competitionId, required String projectLink});
      Future<Either<Failure, WinnersModel>> fetchAllWinners(
      {required int competitionId});
}
