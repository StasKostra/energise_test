import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_info.freezed.dart';
part 'location_info.g.dart';

@freezed
class LocationInfo with _$LocationInfo {
  factory LocationInfo({
    required String query,
   required String status,
  required String country,
  required String countryCode,
  required String region,
  required String regionName,
  required String city,
  required String zip,
  required double lat,
  required double lon,
  required String timezone,
  required String isp,
  required String org,
  }) = _LocationInfo;

  factory LocationInfo.fromJson(Map<String, dynamic> json) =>
      _$LocationInfoFromJson(json);
}
