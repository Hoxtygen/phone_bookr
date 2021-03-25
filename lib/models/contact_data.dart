import 'package:flutter/foundation.dart';
import 'package:phone_bookr/models/contact_model.dart';
import 'dart:collection';
import 'package:contacts_service/contacts_service.dart';

class ContactData extends ChangeNotifier {
  List<WContact> _contacts = [
    WContact(
      firstName: "Magnifera",
      lastName: "Indica",
      phoneNumber: "08097639837",
      isFavorite: false,
    ),
    WContact(
      firstName: "Carica",
      lastName: "Papaya",
      phoneNumber: "08097639837",
      isFavorite: false,
    ),
    WContact(
      firstName: "Elaeis",
      lastName: "Guinensis",
      phoneNumber: "08078098765",
      isFavorite: false,
    ),
    WContact(
      firstName: "Zea",
      lastName: "Mays",
      phoneNumber: "07087787766",
      isFavorite: false,
    ),
    WContact(
      firstName: "Theobroma",
      lastName: "Cacao",
      phoneNumber: "09089876556",
      isFavorite: false,
    ),
    WContact(
      firstName: "Cucumis",
      lastName: "Melo",
      phoneNumber: "08097639837",
      isFavorite: false,
    ),
    WContact(
      firstName: "Capsicum",
      lastName: "FruitScence",
      phoneNumber: "08097639837",
      isFavorite: false,
    ),
    WContact(
      firstName: "Daucas",
      lastName: "Carota",
      phoneNumber: "08078098765",
      isFavorite: false,
    ),
    WContact(
      firstName: "Cocos",
      lastName: "Nucifera",
      phoneNumber: "07087787766",
      isFavorite: false,
    ),
    WContact(
      firstName: "Phoenix",
      lastName: "Dactylifera",
      phoneNumber: "09089876556",
      isFavorite: false,
    ),
  ];

  List<Contact> myContacts;

  // List<Contact> _favoriteContacts = _contacts.where((Contact contact) =>contact.isFavorite == true);
  List<WContact> _favoriteContacts = [];

  UnmodifiableListView<WContact> get contacts {
    // getWasiu();
    return UnmodifiableListView(_contacts);
  }

 /*  Future getWasiu() async {
    List<WContact> wasiu = await PhoneData().getContacts();

    // _contacts.addAll(wasiu);
    print("_contacts: $_contacts");
    return wasiu.toList();
  }
 */
  updateFav() {
    _favoriteContacts =
        _contacts.where((WContact contact) => contact.isFavorite == true);
    return _favoriteContacts;
  }

  UnmodifiableListView<WContact> get favoriteContacts {
    return UnmodifiableListView(_favoriteContacts);
  }

  int get contactCount {
    return _contacts.length;
  }

  int get favcontactCount {
    return _favoriteContacts.length;
  }

  void addContact(String firstName, String lastName, String phoneNumber) {
    final newContact = WContact(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );
    _contacts.add(newContact);
    notifyListeners();
  }

  void removeContact(WContact contact) {
    _contacts.remove(contact);
    notifyListeners();
  }

  makeFavorite(WContact contact) {
    contact.isFavorite = !contact.isFavorite;
    _favoriteContacts.add(contact);
    notifyListeners();
  }

// Write this function in another file
//consume it in this file
// merge the result with the contact in this file
//implement caching to stop repeated calls
  Future getContacts() async {
    // retrieving contacts after permission has been given
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    // myContacts = contacts; 
    print("myContacts: $myContacts");
    return myContacts;
  }
}
