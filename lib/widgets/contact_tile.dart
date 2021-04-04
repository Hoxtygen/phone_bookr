import 'package:flutter/material.dart';
import 'package:phone_bookr/constants/style_constants.dart';
import 'package:phone_bookr/models/contact_model.dart';
import 'package:phone_bookr/widgets/ContactAvatar.dart';
// import 'package:phone_bookr/test_single.dart';

class ContactTile extends StatelessWidget {
  ContactTile({
    this.contact,
    this.onTap,
  });
  final WContact contact;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amberAccent,
      child: ListTile(
        leading: ContactAvatar(contact, 40),
        title: Text(
          contact.contactInfo.displayName,
          style: kcontactTileTitleStyle,
        ),
        subtitle: Text(
          contact.contactInfo.phones.length > 0
              ? contact.contactInfo.phones.elementAt(0).value
              : '',
          style: kcontactTileSubtitleStyle,
        ),
        onTap: onTap,
      ),
    );
  }
}
