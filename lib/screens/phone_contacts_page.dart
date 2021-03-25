import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class PhoneContactsPage extends StatefulWidget {
  @override
  _PhoneContactsPageState createState() => _PhoneContactsPageState();
}

class _PhoneContactsPageState extends State<PhoneContactsPage> {
  Iterable<Contact> _contacts;

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    // retrieving contacts after permission has been given
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // SeeContactsButton(),
        body: _contacts != null
            ? ListView.builder(
                itemCount: _contacts?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  Contact contact = _contacts?.elementAt(index);
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 18.0),
                    leading:
                        (contact.avatar != null && contact.avatar.isNotEmpty)
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(contact.avatar))
                            : CircleAvatar(
                                child: Text(contact.initials()),
                                backgroundColor: Theme.of(context).accentColor,
                              ),
                    title: Text(contact.displayName ?? ''),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[],
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
