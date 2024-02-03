import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:roadradar/src/constants/constants.dart';

import '../../model/hazard_model.dart';
part 'hazard_api_service.g.dart';

@RestApi(baseUrl:baseUrl)
abstract class HazardApiService {
  factory HazardApiService(Dio dio) = _HazardApiService;

  @GET('/api/hazard/getHazard')
  Future<HttpResponse<List<HazardModel>>> getHazards({
    @Query("userId") String ? userId,
    @Query("page") int ? page,
    @Query("size") int? size
  });
}
