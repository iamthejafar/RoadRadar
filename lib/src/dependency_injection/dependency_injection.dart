import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/hazard/data/data_source/remote/hazard_api_service.dart';
import '../features/hazard/data/repo_impl/hazard_repo_impl.dart';
import '../features/hazard/domain/repository/hazard/hazard_repo.dart';
import '../features/hazard/domain/usecase/get_hazard.dart';
import '../features/hazard/presentation/providers/hazard_provider.dart';



final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<HazardApiService>(HazardApiService(locator<Dio>()));
  locator.registerLazySingleton<HazardRepository>(() => HazardRepositoryImpl(locator<HazardApiService>()));
  locator.registerLazySingleton<GetArticleUseCase>(() => GetArticleUseCase(locator<HazardRepository>()));
  locator.registerLazySingleton<HazardNotifier>(() => HazardNotifier(locator<GetArticleUseCase>()));
  print("Setup completed: ${locator<GetArticleUseCase>().runtimeType}");

}
// final s1 = GetIt.instance;
//
//
// //
//
//
//
// Future<void> initializeDependency() async{
//
//   // Dio
//   s1.registerSingleton<Dio>(Dio());
//
//   // Dependencies
//   s1.registerSingleton<HazardApiService>(HazardApiService(s1()));
//
//   s1.registerSingleton<HazardRepository>(
//       HazardRepositoryImpl(s1())
//   );
//
//   // UseCases
//
//   s1.registerSingleton<GetArticleUseCase>(
//     GetArticleUseCase(s1())
//   );
//
//
// }