import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_model.dart';
import 'package:phone_bookr/widgets/contact_tile.dart';
import 'package:phone_bookr/screens/single_contact.dart';

class ContactsList extends StatelessWidget {
  final List<WContact> contacts;
  ContactsList(this.contacts);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
        thickness: 1.0,
      ),
      itemBuilder: (context, index) {
        WContact contactItem = contacts[index];
        return ContactTile(
          contact: contactItem,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SingleContact(
                contact: contactItem,
              );
            }));
          },
        );
      },
      itemCount: contacts.length,
    );
  }
}