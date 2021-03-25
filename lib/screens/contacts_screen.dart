import 'package:flutter/material.dart';
import 'package:phone_bookr/screens/add_contact_screen.dart';
import 'package:phone_bookr/screens/phone_contacts_page.dart';


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
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(),
          Expanded(
            child: Container(
              child: Container(
                // child: ContactsList(),
                //  child: HandlePermission(),
                child: PhoneContactsPage(),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Color(0xffFF4761),
    );
  }
}
