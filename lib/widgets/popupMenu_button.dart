import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_data.dart';
import 'package:phone_bookr/models/contact_model.dart';
import 'package:phone_bookr/models/menu_items.dart';
import 'package:provider/provider.dart';

class PopUpMenuButtonWidget extends StatefulWidget {
  final int contactIndex;
  PopUpMenuButtonWidget({this.contactIndex});

  @override
  _PopUpMenuButtonWidgetState createState() => _PopUpMenuButtonWidgetState();
}

class _PopUpMenuButtonWidgetState extends State<PopUpMenuButtonWidget> {
  final List<MenuItem> menuitems = MenuItem.menuitems;
  Contact contact;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactData>(
      builder: (context, contactData, child) {
        final contacts = contactData.contacts;
        contact = contacts[widget.contactIndex];
        return PopupMenuButton(
          itemBuilder: (context) {
            return menuitems
                .map(
                  (MenuItem menuitem) => PopupMenuItem(
                    child: Text(menuitem.title),
                    value: menuitem.value,
                  ),
                )
                .toList();
          },
          onSelected: (value) {
            print(value);
            // print(contacts[widget.contactIndex].firstName);
            if (value == "delete") {
              setState(() {
                ContactData().removeContact(contact);
                // print(ContactData().contactCount);
              });
            }
          },
        );
      },
    );
  }
}
