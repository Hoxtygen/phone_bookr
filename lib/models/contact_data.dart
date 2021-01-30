import 'package:flutter/foundation.dart';
import 'package:phone_bookr/models/contact_model.dart';
import 'dart:collection';

class ContactData extends ChangeNotifier {
  List<Contact> _contacts = [
    Contact(
      firstName: "Magnifera",
      lastName: "Indica",
      phoneNumber: "08097639837",
      isFavorite: false,
    ),
    Contact(
      firstName: "Carica",
      lastName: "Papaya",
      phoneNumber: "08097639837",
      isFavorite: false,
    ),
    Contact(
      firstName: "Elaeis",
      lastName: "Guinensis",
      phoneNumber: "08078098765",
      isFavorite: false,
    ),
    Contact(
      firstName: "Zea",
      lastName: "Mays",
      phoneNumber: "07087787766",
      isFavorite: false,
    ),
    Contact(
      firstName: "Theobroma",
      lastName: "Cacao",
      phoneNumber: "09089876556",
      isFavorite: false,
    ),
    Contact(
      firstName: "Cucumis",
      lastName: "Melo",
      phoneNumber: "08097639837",
      isFavorite: false,
    ),
    Contact(
      firstName: "Capsicum",
      lastName: "FruitScence",
      phoneNumber: "08097639837",
      isFavorite: false,
    ),
    Contact(
      firstName: "Daucas",
      lastName: "Carota",
      phoneNumber: "08078098765",
      isFavorite: false,
    ),
    Contact(
      firstName: "Cocos",
      lastName: "Nucifera",
      phoneNumber: "07087787766",
      isFavorite: false,
    ),
    Contact(
      firstName: "Phoenix",
      lastName: "Dactylifera",
      phoneNumber: "09089876556",
      isFavorite: false,
    ),
  ];

  UnmodifiableListView<Contact> get contacts {
    return UnmodifiableListView(_contacts);
  }

  int get contactCount {
    return _contacts.length;
  }

  void addContact(String firstName, String lastName, String phoneNumber) {
    final newContact = Contact(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
    );
    _contacts.add(newContact);
    notifyListeners();
  }

  void removeContact(Contact contact) {
    _contacts.remove(contact);
    notifyListeners();
  }

   makeFavorite(Contact contact) {
    contact.isFavorite = !contact.isFavorite;
    notifyListeners();
  }
}
