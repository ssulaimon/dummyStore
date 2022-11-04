class Address {
  String street;
  String subLocality;
  String postalCode;
  String subAdministrativeArea;
  String country;
  Address({
    required this.postalCode,
    required this.street,
    required this.subAdministrativeArea,
    required this.subLocality,
    required this.country,
  });
}
