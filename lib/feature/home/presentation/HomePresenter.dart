import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:myweather2/feature/home/domain/model/WeatherTypeModel.dart';

class HomePresenter extends GetxController {
  var address = "";
  WeatherTypeModel weatherTypeModel = WeatherTypeModel();

  getCurrentTimeType() {
    var currentHour = DateTime.now().hour;
    print(currentHour);

    if (currentHour >= 0 && currentHour < 12) {
      // its morning
      weatherTypeModel = WeatherTypeModel(
          image: "lib/assets/image/morning.jpeg", type: "Morning");
    } else if (currentHour >= 12 && currentHour < 18) {
      // its afternoon
      weatherTypeModel = WeatherTypeModel(
          image: "lib/assets/image/noon.jpeg", type: "Afternoon");
    } else if (currentHour >= 18 && currentHour < 21) {
      // its evening;
      weatherTypeModel = WeatherTypeModel(
          image: "lib/assets/image/noon.jpeg", type: "Evening");
    } else {
      weatherTypeModel = WeatherTypeModel(
          image: "lib/assets/image/night.jpeg", type: "Evening");
    }

    update();
  }

  _getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<geo.Placemark> placemarks =
      await geo.placemarkFromCoordinates(latitude, longitude);

      geo.Placemark place = placemarks[0];

      print("${place.locality}, ${place.postalCode}, ${place.country}");

      address = "${place.locality}, ${place.country}";
    } catch (e) {
      print(e);
    }

    update();
  }

  getCurrentLocation() async {
    try {
      var permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        await Geolocator.requestPermission();
      }

      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      var lastPosition = await Geolocator.getLastKnownPosition();
      print(lastPosition);

      print("$position.latitude, $position.longitude");

      _getAddressFromLatLng(position.latitude, position.longitude);
    } catch (e) {
      print(e);
    }
  }
}
