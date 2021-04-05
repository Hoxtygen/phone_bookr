import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_model.dart';
import 'package:phone_bookr/widgets/contact_tile.dart';
import 'package:phone_bookr/screens/single_contact.dart';

class ContactsList extends StatelessWidget {
  ContactsList({this.allContacts, this.reloadContacts});
  final List<WContact> allContacts;
  final Function reloadContacts;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
        thickness: 1.0,
      ),
      itemBuilder: (context, index) {
        WContact contactItem = allContacts[index];
        return ContactTile(
          contact: contactItem,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SingleContact(
                contact: contactItem,
                handleUpdate: (WContact _contact) {
                  reloadContacts();
                },
              );
            }));
          },
        );
      },
      itemCount: allContacts.length,
    );
  }
}
