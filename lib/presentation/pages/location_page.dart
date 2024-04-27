import 'package:energise_test/data/repository/location_repository.dart';
import 'package:energise_test/domain/model/location_info/location_info.dart';
import 'package:energise_test/get_it.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multiple_result/multiple_result.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationInfo? locationInfo;

  final locationRepository = locate<LocationRepository>();

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  void _getLocation() async {
    Result<LocationInfo, Exception> locationInfoResult =
        await locationRepository.getLocationInfo();
    locationInfoResult.whenSuccess((success) => locationInfo = success);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SafeArea(
          child: locationInfo != null
              ? RefreshIndicator(
                  onRefresh: () async {
                    _getLocation();
                  },
                  child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                          )
                        ],
                      ),
                      Column(children: [
                        SizedBox(
                            width: 300,
                            height: 300,
                            child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                    zoom: 10,
                                    target: LatLng(locationInfo!.lat,
                                        locationInfo!.lon)))),
                        const SizedBox(height: 30),
                        Center(
                            child: Column(
                          children: [
                            Text(locationInfo!.city),
                            Text(locationInfo!.country),
                            Text(locationInfo!.timezone),
                          ],
                        ))
                      ]),
                      // Your Widget
                    ],
                  ))
              : const LinearProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getLocation();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
