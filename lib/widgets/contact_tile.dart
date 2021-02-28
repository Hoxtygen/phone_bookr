import 'package:flutter/material.dart';
// import 'package:phone_bookr/test_single.dart';

class ContactTile extends StatelessWidget {
  ContactTile({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.contactIndex,
    this.deleteCallback,
    this.onTap,
  });

  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int contactIndex;
  final Function deleteCallback;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30.0,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          child: Icon(Icons.image),
          radius: 27.0,
        ),
      ),
      title: Text(
        "$firstName  $lastName",
        style: TextStyle(
          color: Colors.white,
          fontSize: 23.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "$phoneNumber",
        style: TextStyle(
          color: Colors.white70,
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      onLongPress: deleteCallback,
      onTap:onTap,
    );
  }
}
