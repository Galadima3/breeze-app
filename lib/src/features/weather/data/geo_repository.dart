import 'dart:developer';

import 'package:breeze/src/features/weather/domain/geo_model.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepository {
  // Method to check if geolocation permission is granted
  Future<bool> isPermissionGranted() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      return true;
    }
    return false;
  }

  // Method to request geolocation permission
  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  // Method to get current location coordinates
  Future<GeoCoordinates> getCurrentLocation() async {
    bool permissionGranted = await isPermissionGranted();
    if (permissionGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        return GeoCoordinates(
            latitude: position.latitude, longitude: position.longitude);
      } catch (e) {
        // Handle exception if unable to get location
        log("Error getting location: $e");
        throw Exception("Failed to get geolocation coordinates");
      }
    } else {
      // Request permission and retry getting location
      await requestPermission();
      // Recursive call to get location after permission is granted
      return await getCurrentLocation();
    }
  }
}
