import 'package:flutter/material.dart';
import 'package:phone_bookr/models/color_gradient.dart';
import 'package:phone_bookr/models/contact_model.dart';

class ContactAvatar extends StatelessWidget {
  ContactAvatar(this.contact, this.size);
  final WContact contact;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (contact.contactInfo.avatar != null &&
              contact.contactInfo.avatar.length > 0)
          ? CircleAvatar(
              backgroundImage: MemoryImage(contact.contactInfo.avatar),
            )
          : CircleAvatar(
              child: Text(contact.contactInfo.initials(),
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.transparent),
      decoration: BoxDecoration(
          shape: BoxShape.circle, gradient: colorGradient(contact.color)),
      width: size,
      height: size,
    );
  }
}
