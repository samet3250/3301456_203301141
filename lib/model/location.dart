import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class LocationHelper{
    double? latitude;
    double? longitude;

  Future<void> getCurrentLocation() async{
    bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return ;
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return ;
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  var loc=await Geolocator.getCurrentPosition();
   latitude=loc.latitude;
  longitude=loc.longitude;


  }


}