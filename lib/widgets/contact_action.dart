import 'package:flutter/material.dart';

class ContactAction {
  const ContactAction({
    @required this.title,
    @required this.icon,
    @required this.color,
  });
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<ContactAction> contactActions = <ContactAction>[
  ContactAction(title: "Favourite", icon: Icons.star_border, color: Colors.red),
  ContactAction(title: "Edit", icon: Icons.mode_edit, color: Colors.blue),
  ContactAction(title: "More", icon: Icons.more_vert, color: Colors.green),
];
