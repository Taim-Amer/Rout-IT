import 'package:dartz/dartz.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/features/home/data/models/level_model.dart';
import 'package:route_it27/features/home/data/models/technologies_model.dart';
import 'package:route_it27/features/home/data/models/technology_category_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<TechnologyCategoryModel>>> fetchAllCategories();
  Future<Either<Failure, List<TechnologiesModel>>> fetchTechnologies(
      {required int id});

        Future<Either<Failure, List<LevelModel>>> fetchLevels(
      {required int id});
}
