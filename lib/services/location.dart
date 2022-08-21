import 'package:geolocator/geolocator.dart';

class LocationGetter {
  double latitude;
  double longitude;

  Future<void> getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
