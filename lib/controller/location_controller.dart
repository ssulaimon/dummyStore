import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart' as geolocation;
import 'package:get/get.dart';
import 'package:grocy/model/address.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  late bool enabledGranted;
  late geolocation.LocationPermission permissionStatus;
  final postion = Rxn<geolocation.Position>();
  final address = Rxn<Address>();

  @override
  void onInit() async {
    super.onInit();

    await locationLat();
  }

  Future<Address> locationLat() async {
    enabledGranted = await geolocation.Geolocator.isLocationServiceEnabled();

    if (!enabledGranted) {
      Get.snackbar('Location', 'Location service need');

      return Future.error('service not granted');
    }
    permissionStatus = await geolocation.Geolocator.checkPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await geolocation.Geolocator.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        Get.snackbar('Permission', 'Permission service need');
        return Future.error('no permission');
      }
      if (permissionStatus == PermissionStatus.deniedForever) {
        Get.snackbar('Denied', 'Permission service need');
        return Future.error('denied for ever');
      }
    }

    await geolocation.Geolocator.getCurrentPosition(
            desiredAccuracy: geolocation.LocationAccuracy.high)
        .then((geolocation.Position curentpostion) {
      postion(curentpostion);
    }).catchError((e) {
      log(e.toString());
    });

    await placemarkFromCoordinates(
            postion.value!.latitude, postion.value!.longitude)
        .then((List<Placemark> placemark) {
      address(Address(
          postalCode: placemark[0].postalCode!,
          street: placemark[0].street!,
          subAdministrativeArea: placemark[0].subAdministrativeArea!,
          subLocality: placemark[0].subLocality!,
          country: placemark[0].country!));
    });

    return address.value!;
  }
}
