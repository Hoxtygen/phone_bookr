import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_data.dart';
import 'package:phone_bookr/widgets/contact_action.dart';
import 'package:provider/provider.dart';

class SingleContact extends StatelessWidget {
  SingleContact({@required this.contactIndex});
  final contactIndex;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Consumer<ContactData>(builder: (context, contactData, child) {
      final contact = contactData.contacts[contactIndex];
      return Scaffold(
        appBar: AppBar(
          title: Text("Single Contact Page"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.red,
              height: deviceHeight * 0.30,
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.lightBlueAccent,
                    radius: 70.0,
                    child: Text(
                      "${contact.firstName.substring(0, 1)}${contact.lastName.substring(0, 1)}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '${contact.firstName} ${contact.lastName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '${contact.phoneNumber}',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20.0,
                          fontFamily: "Source Sans Pro",
                        ),
                      ),
                    ),
                  ),
                  Text(contact.lastName),
                  Text(contact.phoneNumber),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.greenAccent,
        bottomNavigationBar: BottomNavigationBar(
          items: contactActions.map((ContactAction contactAction) {
            return BottomNavigationBarItem(
                icon: Icon(contactAction.icon),
                label: contactAction.title,
                backgroundColor: contactAction.color);
          }).toList(),
        ),
      );
    });
  }
}
