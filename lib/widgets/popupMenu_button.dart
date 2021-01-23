import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_data.dart';
import 'package:phone_bookr/models/menu_items.dart';
import 'package:provider/provider.dart';

class PopUpMenuButtonWidget extends StatelessWidget {
  PopUpMenuButtonWidget({this.contactIndex, this.deleteContact});
  final int contactIndex;
  final Function deleteContact;
  final List<MenuItem> menuitems = MenuItem.menuitems;
  //  Contact contact;

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactData>(
      builder: (context, contactData, child) {
        // final contacts = contactData.contacts;
        // contact = contacts[widget.contactIndex];
        return PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return menuitems
                .map(
                  (MenuItem menuitem) => PopupMenuItem(
                    child: Text(menuitem.title),
                    value: menuitem.value,
                  ),
                )
                .toList();
          },
          elevation: 4.5,
          onSelected: (value) {
            print(value);
            switch (value) {
              case "favourite":
                print("You chose to $value");
                return "You chose to $value";

              case "share":
                print("You chose to $value");
                return "You chose to $value";

              case "delete":
                print("You chose to $value");
                return deleteContact();

              case "edit":
                print("You chose to $value");
                return "You chose to $value";
                
              case "copy":
                print("You chose to $value");

                return "You chose to $value";
              default:
                throw new Error();
            }
          },
        );
      },
    );
  }
}
