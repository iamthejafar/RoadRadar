
import '../../../../../domain/data_state.dart';
import '../../entity/hazard.dart';

abstract class HazardRepository {
  Future<DataState<List<HazardEntity>>> getHazards({int? page, int? size});

}