import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:phone_bookr/models/contact_data.dart';
import 'package:phone_bookr/screens/contacts_screen.dart';
import 'package:phone_bookr/widgets/my_button.dart';

class SingleContact extends StatelessWidget {
  SingleContact({@required this.contactIndex});
  final contactIndex;
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Contact Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Consumer<ContactData>(builder: (context, contactData, child) {
          final contact = contactData.contacts[contactIndex];
          return Column(
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
                    Expanded(
                      child: Text(
                        '${contact.firstName} ${contact.lastName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 25.0),
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
                      margin: EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 25.0),
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
                      margin: EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 25.0),
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
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      onTap: () {
                        contactData.makeFavorite(contact);
                      },
                      icon: contact.isFavorite
                          ? Icons.star_rate
                          : Icons.star_outline,
                      iconText: "Favorite",
                    ),
                    MyButton(
                      onTap: () {
                        print("You pressed me to edit:  $contactIndex");
                      },
                      icon: Icons.mode_edit,
                      iconText: "Edit",
                    ),
                    MyButton(
                      onTap: () {
                        showModalBottomSheet<Null>(
                            context: context,
                            backgroundColor: Colors.blueAccent,
                            builder: (BuildContext context) {
                              return ListView(
                                children: <Widget>[
                                  //Add menu item to edit
                                  ListTile(
                                    leading: Icon(Icons.share),
                                    title: Text('Share contact'),
                                  ),
                                  ListTile(
                                    //Add menu item to add a new item
                                    leading: const Icon(Icons.copy),
                                    title: const Text('Copy'),
                                  ),
                                  ListTile(
                                    //Add menu item to add a new item
                                    leading: Icon(Icons.delete),
                                    title: Text('Delete'),
                                    onTap: () {
                                      contactData.removeContact(contact);
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ContactsScreen();
                                      }));
                                    },
                                  ),
                                  ListTile(
                                    //Add menu item to add a new item
                                    leading: Icon(Icons.swap_horizontal_circle),
                                    title: Text('Create shortcut'),
                                  ),
                                  ListTile(
                                    //Add menu item to add a new item
                                    leading: Icon(Icons.app_blocking),
                                    title: Text('Add to blacklist'),
                                  ),
                                ],
                              );
                            });
                      },
                      icon: Icons.more_vert,
                      iconText: "More",
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
