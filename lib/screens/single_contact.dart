import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:phone_bookr/models/contact_model.dart';
import 'package:phone_bookr/widgets/ContactAvatar.dart';
import 'package:phone_bookr/widgets/my_button.dart';

import 'contacts_screen.dart';

class SingleContact extends StatefulWidget {
  SingleContact(
      {@required this.contact,
      @required this.handleUpdate,
      @required this.handleDelete});
  final WContact contact;
  final Function(WContact) handleUpdate;
  final Function(WContact) handleDelete;

  @override
  _SingleContactState createState() => _SingleContactState();
}

class _SingleContactState extends State<SingleContact> {
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    deleteConfirmationDialog() {
      Widget cancelBtn = TextButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: Text('Cancel'),
      );

      Widget deleteBtn = TextButton(
        style: TextButton.styleFrom(primary: Colors.red),
        onPressed: () async {
          await ContactsService.deleteContact(widget.contact.contactInfo);
          widget.handleDelete(widget.contact);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactsScreen()),
          );
        },
        child: Text('Remove'),
      );

      AlertDialog alert = AlertDialog(
        title: Text('Remove Contact?'),
        content: Text('Are you sure you want to remove this contact?'),
        actions: <Widget>[
          cancelBtn,
          deleteBtn,
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    List<String> actions = <String>[
      'Share',
      'Copy',
      'Delete',
      'Create shortcut',
      'Blacklist',
    ];

    onTapAction(String action) {
      switch (action) {
        case 'Delete':
          deleteConfirmationDialog();
          break;
        case 'Copy':
          print("Copying job in action");
          break;
        default:
          throw new Error();
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.red,
                height: deviceHeight * 0.30,
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Align(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Column(
                      children: [
                        Center(
                          child: ContactAvatar(widget.contact, 150),
                        ),
                        Center(
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
                    Align(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: PopupMenuButton(
                            onSelected: onTapAction,
                            itemBuilder: (BuildContext context) {
                              return actions.map((String action) {
                                return PopupMenuItem(
                                  child: Text(action),
                                  value: action,
                                );
                              }).toList();
                            }),
                      ),
                      alignment: Alignment.topRight,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
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
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
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
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
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
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
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
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyButton(
                onTap: () {
                  // contactData.makeFavorite(widget.contact);
                  print('Clicked favorite button');
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
                      case FormOperationErrorCode.FORM_OPERATION_UNKNOWN_ERROR:
                        print(e.toString());

                      /*  break;
                  default: */
                    }
                  }
                },
                icon: Icons.mode_edit,
                iconText: "Edit",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
