import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:phone_bookr/models/contact_model.dart';
import 'package:phone_bookr/widgets/contacts_list.dart';

class PhoneContactsPage extends StatefulWidget {
  @override
  _PhoneContactsPageState createState() => _PhoneContactsPageState();
}

class _PhoneContactsPageState extends State<PhoneContactsPage> {
  List<WContact> contacts;
  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    List colors = [Colors.green, Colors.indigo, Colors.yellow, Colors.orange];
    int colorIndex = 0;
    // retrieve contacts after permission has been given
    List<WContact> _contacts =
        (await ContactsService.getContacts()).map((contact) {
      Color baseColor = colors[colorIndex];
      colorIndex++;
      if (colorIndex == colors.length) {
        colorIndex = 0;
      }
      return new WContact(color: baseColor, contactInfo: contact);
    }).toList();
    setState(() {
      contacts = _contacts;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: contacts != null
          ? ContactsList(contacts)
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
