





import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../constants/constants.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl:Constants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @GET('/api/auth/login')
  Future<HttpResponse<dynamic>> login({
    @Query("email") required String email,
    @Query("password") required String password,
  });


  @GET('/api/auth/signup')
  Future<HttpResponse<String>> signup({
    @Query("email") required String email,
    @Query("password") required String password,
  });
}