import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/presentation/main/view_model/home_view_model.dart';

import '../data/network/api_app.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/remote_source/remote_data_source.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repo/repository.dart';
import '../domain/useCase/property_useCase.dart';


import 'app_prefs.dart';

final instance = GetIt.instance;

///this general decency injection
Future<void> initAppModule() async {
  //shared preference instance
  final sharedPref = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
      () => sharedPref); //this create when call

  //instance app preferences

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //app service client

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  // repo

  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

///this login decency injection
initHomeModule() {
  // peter to user factory

  //this is register before or not
  if (!GetIt.I.isRegistered<PropertyUseCase>()) {
    instance.registerFactory<PropertyUseCase>(() => PropertyUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
    
  }
}


