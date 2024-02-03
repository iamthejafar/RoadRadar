import 'dart:io';
import 'package:dio/dio.dart';
import 'package:roadradar/src/utils/shared_preferences/shared_preferences.dart';

import '../../../../domain/data_state.dart';
import '../../domain/repository/hazard/hazard_repo.dart';
import '../data_source/remote/hazard_api_service.dart';
import '../model/hazard_model.dart';

class HazardRepositoryImpl implements HazardRepository {
  final HazardApiService _apiService;
  HazardRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<HazardModel>>> getHazards({int? page, int? size}) async {
    try {
      final httpResponse =
          await _apiService.getHazards(userId: UserPreferences.userId, page: page, size:  size);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            error: httpResponse.response.statusMessage));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
