import 'package:dartz/dartz.dart';
import 'package:route_it27/core/errors/failures.dart';
import 'package:route_it27/features/search/data/models/general_search_model.dart';
import 'package:route_it27/features/search/data/models/road_map_search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, GeneralSearchModel>> generalSearch({required String name});

  Future<Either<Failure, RoadMapSearchModel>> roadMapSearch({required String roadMap});
}
