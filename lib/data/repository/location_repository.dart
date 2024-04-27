import 'package:energise_test/data/data_source/location_data_source.dart';
import 'package:energise_test/domain/model/location_info/location_info.dart';
import 'package:energise_test/get_it.dart';
import 'package:multiple_result/multiple_result.dart';

class LocationRepository {
  final locationDataSourse = locate<LocationDataSourse>();

  Future<Result<LocationInfo, Exception>> getLocationInfo() async {
    try {
      final result = await locationDataSourse.getInfoByIp();

      return Result.success(result);
    } catch (e) {
      return Result.error(Exception('Error fetching location info: $e'));
    }
  }
}
