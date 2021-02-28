import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_data.dart';
import 'package:phone_bookr/widgets/contact_tile.dart';
import 'package:provider/provider.dart';
import 'package:phone_bookr/screens/single_contact.dart';


class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactData>(
      builder: (context, contactData, child) {
        return ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
            thickness: 2.0,
          ),
          itemBuilder: (context, index) {
            final contact = contactData.contacts[index];
            return ContactTile(
              firstName: contact.firstName,
              lastName: contact.lastName,
              phoneNumber: contact.phoneNumber,
              contactIndex: index,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SingleContact(contactIndex: index,);
                }));
              },
            );
          },
          itemCount: contactData.contactCount,
        );
      },
    );
  }
}
