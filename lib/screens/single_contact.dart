import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_data.dart';
import 'package:phone_bookr/widgets/my_button.dart';
import 'package:provider/provider.dart';

class SingleContact extends StatefulWidget {
  SingleContact({@required this.contactIndex});
  final contactIndex;

  @override
  _SingleContactState createState() => _SingleContactState();
}

class _SingleContactState extends State<SingleContact> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Consumer<ContactData>(builder: (context, contactData, child) {
      final contact = contactData.contacts[widget.contactIndex];
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
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '${contact.firstName}',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20.0,
                          fontFamily: "Source Sans Pro",
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '${contact.lastName}',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20.0,
                          fontFamily: "Source Sans Pro",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50.0,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  MyButton(
                    onTap: () {
                      print("You pressed me");
                    },
                    icon: Icons.star_border_outlined,
                    iconText: "Favorite",
                  ),
                  MyButton(
                    onTap: () {
                      print("You pressed me");
                    },
                    icon: Icons.mode_edit,
                     iconText: "Edit",
                  ),
                  MyButton(
                    onTap: () {
                      print("You pressed me");
                    },
                    icon: Icons.more_vert,
                     iconText: "More",
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.greenAccent,
      );
    });
  }
}
