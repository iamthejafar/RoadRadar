
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:roadradar/src/constants/constants.dart';
import 'package:roadradar/src/features/auth/data/data_source/remote/auth_api_service.dart';
import 'package:roadradar/src/features/auth/data/repository_impl/auth_repo_impl.dart';
import 'package:roadradar/src/features/auth/domain/usecase/login.dart';
import 'package:roadradar/src/features/auth/presentation/providers/auth_provider.dart';

import '../features/hazard/data/data_source/remote/hazard_api_service.dart';
import '../features/hazard/data/repo_impl/hazard_repo_impl.dart';
import '../features/hazard/domain/repository/hazard/hazard_repo.dart';
import '../features/hazard/domain/usecase/get_hazard.dart';
import '../features/hazard/presentation/providers/hazard_provider.dart';



final GetIt locator = GetIt.instance;
enum ContentType { urlEncoded, json, multipart }

void setupLocator() {
  Dio jsonDio = locator.registerSingleton<Dio>(
    buildDioClient(contentType: ContentType.json),
    instanceName: 'jsonDio',
  );

  Dio multipartDio = locator.registerSingleton<Dio>(
    buildDioClient(contentType: ContentType.multipart),
    instanceName: 'multipartDio',
  );

  Dio urlEncodeDio = locator.registerSingleton<Dio>(
    buildDioClient(contentType: ContentType.multipart),
    instanceName: 'urlEncodeDio',
  );


  // Auth
  locator.registerSingleton<AuthApiService>(AuthApiService(jsonDio));
  locator.registerLazySingleton<AuthRepositoryImpl>(()=>(AuthRepositoryImpl(locator<AuthApiService>())));
  locator.registerLazySingleton<LoginUseCase>(()=> LoginUseCase(locator<AuthRepositoryImpl>()));
  locator.registerLazySingleton<AuthNotifier>(() => AuthNotifier(locator<LoginUseCase>()));

  // Hazard
  locator.registerSingleton<HazardApiService>(HazardApiService(jsonDio));
  locator.registerLazySingleton<HazardRepository>(() => HazardRepositoryImpl(locator<HazardApiService>()));
  locator.registerLazySingleton<GetHazardsUseCase>(() => GetHazardsUseCase(locator<HazardRepository>()));
  locator.registerLazySingleton<HazardNotifier>(() => HazardNotifier(locator<GetHazardsUseCase>()));

}



Dio buildDioClient({String? baseUrl, ContentType? contentType}){
  String content;

  contentType ??= ContentType.urlEncoded;
  baseUrl ??= Constants.baseUrl;

  if (contentType == ContentType.multipart) {
    content = 'multipart/form-data';
  } else if (contentType == ContentType.json) {
    content = 'application/json; charset=utf-8';
  }
  else {
    content = 'application/x-www-form-urlencoded';
  }

  final headers = {
    'accept': '*/*',
    'Content-Type': content,
  };
  final dio = Dio()..options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 3),
    receiveTimeout: const Duration(seconds: 3),
    sendTimeout: const Duration(seconds: 3),
    headers: headers,
  );

  dio.interceptors.addAll(
      [
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        )
      ]
  );
  return dio;
}