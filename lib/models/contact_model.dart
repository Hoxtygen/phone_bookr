class WContact {
  //change this name because it's having conflict with the contact_service package
  WContact({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.isFavorite = false,
  });

  String firstName;
  String lastName;
  String phoneNumber;
  bool isFavorite;
}
