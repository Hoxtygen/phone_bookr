import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String phoneNumber;

  ContactTile({this.firstName, this.lastName, this.phoneNumber});
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
      trailing: Icon(Icons.more_vert),
      // tileColor: Colors.amberAccent,
    );
  }
}
