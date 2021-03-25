import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_data.dart';
import 'package:phone_bookr/models/contact_model.dart';
import 'package:phone_bookr/widgets/contact_tile.dart';
import 'package:provider/provider.dart';

class FavoriteContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactData>(
      builder: (context, contactData, child) {
        List<WContact> favorite = contactData.contacts
            .where((WContact contact) => contact.isFavorite == true)
            .toList();
        return Container(
          color: Colors.redAccent,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.blue,
              thickness: 2.0,
            ),
            itemCount: contactData.favcontactCount,
            itemBuilder: (context, index) {
              final contact = favorite[index];
              return ContactTile(
                firstName: contact.firstName,
                lastName: contact.lastName,
                phoneNumber: contact.phoneNumber,
                contactIndex: index,
                // onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     return SingleContact(
                //       contactIndex: index,
                //     );
                //   }));
                // },
              );
            },
          ),
        );
      },
    );
  }
}
