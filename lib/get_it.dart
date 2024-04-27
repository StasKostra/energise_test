import 'package:dio/dio.dart';
import 'package:energise_test/data/data_source/location_data_source.dart';
import 'package:energise_test/data/repository/location_repository.dart';
import 'package:get_it/get_it.dart';

class GetItService {
  static final getIt = GetIt.instance;
  static initializeDependencies() {
    final dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';

    getIt.registerSingleton<Dio>(dio);

    getIt.registerSingleton<LocationDataSourse>(LocationDataSourse());
    getIt.registerSingleton<LocationRepository>(LocationRepository());
  }
}

T locate<T extends Object>() {
  return GetItService.getIt<T>();
}
