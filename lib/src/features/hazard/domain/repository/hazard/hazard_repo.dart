
import '../../../../../comman/models/data_state.dart';
import '../../entity/hazard.dart';

abstract class HazardRepository {
  Future<DataState<List<HazardEntity>>> getHazards({int? page, int? size});
  Future<DataState<String>> addHazard({required HazardEntity hazardEntity});
}