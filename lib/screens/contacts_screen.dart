import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:phone_bookr/screens/phone_contacts_page.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            Contact contact = await ContactsService.openContactForm();
            if (contact != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactsScreen()),
              );
            }
          } on FormOperationException catch (e) {
            switch (e.errorCode) {
              case FormOperationErrorCode.FORM_OPERATION_CANCELED:
              case FormOperationErrorCode.FORM_COULD_NOT_BE_OPEN:
              case FormOperationErrorCode.FORM_OPERATION_UNKNOWN_ERROR:
                break;
              default:
                throw  ErrorDescription("Uhandled Exception");
            }
          }
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: PhoneContactsPage(),
      ),
      backgroundColor: Color(0xffFF4761),
    );
  }
}
