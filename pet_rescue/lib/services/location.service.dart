import 'dart:async';
import 'package:latlong/latlong.dart';
import 'package:location/location.dart';

class LocationService {
  static Future<LatLng> getCurrentLocation() async {
    Location location = new Location();
    var currentLocation = <String, double>{};

    try{
      currentLocation = await location.getLocation;
    }
    catch(Exception){
      currentLocation = {'latitude': 0.0, 'longitude': 0.0};
    }

    return await Future.delayed(
        const Duration(milliseconds: 500),
        () => new LatLng(
            currentLocation['latitude'], currentLocation['longitude']));
  }
}
