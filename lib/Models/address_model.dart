import 'package:geocoding/geocoding.dart';

class Address {
  String? country;
  String? locality;
  String? subLocality;
  String? state;
  String? street;
  String? subAdministrativeArea;

  Address({
    this.country,
    this.locality,
    this.subLocality,
    this.state,
    this.street,
    this.subAdministrativeArea,
  });

  Address.fromPlacemark(Placemark placemark) {
    country = placemark.country;
    locality = placemark.locality;
    subLocality = placemark.subLocality;
    state = placemark.administrativeArea;
    street = placemark.street;
    subAdministrativeArea = placemark.subAdministrativeArea;
  }
}
