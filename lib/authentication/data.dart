import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class data {
  static List sports_data=[];


  static Future<String?> get_address(LatLng latLng) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    Placemark place = placemarks[0];
    if (place.street!.isNotEmpty) {
      return '${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}';
    } else {
      return '${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}';
    }
  }
}
