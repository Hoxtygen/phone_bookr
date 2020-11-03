import 'package:flutter/material.dart';
import 'package:phone_bookr/screens/add_contact_screen.dart';
import 'package:phone_bookr/widgets/contacts_list.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddContactScreen(),
              ),
            ),
          );
        },
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.add),
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            padding: EdgeInsets.only(
              top: 60.0,
              right: 20.0,
              bottom: 30.0,
              left: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Contact List",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                    CircleAvatar(
                      child: Icon(
                        Icons.apps,
                        size: 30.0,
                      ),
                      radius: 20.0,
                      backgroundColor: Color(0xff8F58FF),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Container(
                child: ContactsList(),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xffFF4761),
    );
  }
}
