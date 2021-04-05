import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_model.dart';
import 'package:phone_bookr/screens/contacts_screen.dart';
import 'package:phone_bookr/widgets/ContactAvatar.dart';
import 'package:phone_bookr/widgets/my_button.dart';
import 'package:flutter/services.dart';

class SingleContact extends StatefulWidget {
  SingleContact({@required this.contact, @required this.handleUpdate});
  final WContact contact;
  final Function(WContact) handleUpdate;

  @override
  _SingleContactState createState() => _SingleContactState();
}

class _SingleContactState extends State<SingleContact> {
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Contact Page"),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            color: Colors.red,
            height: deviceHeight * 0.30,
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContactAvatar(widget.contact, 150),
                Expanded(
                  child: Text(
                    '${widget.contact.contactInfo.givenName} ${widget.contact.contactInfo.familyName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
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
                  margin:
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '${widget.contact.contactInfo.phones.first.value}',
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
                      '${widget.contact.contactInfo.givenName}',
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
                      '${widget.contact.contactInfo.familyName}',
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
                    // contactData.makeFavorite(widget.contact);
                    print('Cickde favorite button');
                  },
                  icon: Icons.star_rate,
                  // widget.contact.isFavorite
                  // ? Icons.star_rate
                  // : Icons.star_outline,
                  iconText: "Favorite",
                ),
                MyButton(
                  onTap: () async {
                    try {
                      Contact updatedContact =
                          await ContactsService.openExistingContact(
                              widget.contact.contactInfo);
                      setState(() {
                        widget.contact.contactInfo = updatedContact;
                      });
                      widget.handleUpdate(widget.contact);
                    } on FormOperationException catch (e) {
                      switch (e.errorCode) {
                        case FormOperationErrorCode.FORM_OPERATION_CANCELED:
                        case FormOperationErrorCode.FORM_COULD_NOT_BE_OPEN:
                        case FormOperationErrorCode
                            .FORM_OPERATION_UNKNOWN_ERROR:
                          print(e.toString());

                        /*  break;
              default: */
                      }
                    }
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
                                onTap: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: widget.contact.contactInfo.phones
                                                  .length >
                                              0
                                          ? widget.contact.contactInfo.phones
                                              .elementAt(0)
                                              .value
                                          : '',
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                //Add menu item to add a new item
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                                onTap: () {
                                  // contactData.removeContact(widget.contact);
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
      )),
    );
  }
}
