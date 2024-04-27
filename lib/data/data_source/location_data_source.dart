import 'package:dio/dio.dart';
import 'package:energise_test/domain/model/location_info/location_info.dart';
import 'package:energise_test/get_it.dart';

class LocationDataSourse {
  final _dio = locate<Dio>();

  Future<LocationInfo> getInfoByIp(
      // {required double lat, required double lon}
      ) async {
    try {
      final ip =await getIp();
      final response = await _dio.get('http://ip-api.com/json/$ip');
      final data = LocationInfo.fromJson(response.data);
      return data;
    } catch (e, stack) {
      print(stack);
      rethrow;
    }
  }

  Future<String> getIp() async {
    try {
      final response = await _dio.get('https://api.ipify.org/');
      return response.data.toString();
    } catch (e, stack) {
      print(stack);
      rethrow;
    }
  }
}
