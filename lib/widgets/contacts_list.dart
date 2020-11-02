import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_data.dart';
import 'package:phone_bookr/widgets/contact_tile.dart';
import 'package:provider/provider.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactData>(
      builder: (context, contactData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final contact = contactData.contacts[index];
            return ContactTile(
              firstName: contact.firstName,
              lastName: contact.lastName,
              phoneNumber: contact.phoneNumber,
            );
          },
          itemCount: contactData.contactCount,
        );
      },
      
    );
  }
}