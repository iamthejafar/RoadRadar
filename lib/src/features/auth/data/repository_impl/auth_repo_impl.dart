


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:roadradar/src/features/auth/data/data_source/remote/auth_api_service.dart';
import 'package:roadradar/src/features/auth/domain/repository/auth_repo.dart';

import '../../../../comman/models/data_state.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _apiService;
  AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<dynamic>> login({required String email, required String password}) async {
    try {
      final httpResponse =
      await _apiService.login(email: email,password: password);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            error: httpResponse.response.statusMessage));
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> signUp({required String email, required String password}) async {
    try {
      final httpResponse =
          await _apiService.signup(email: email,password: password);
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