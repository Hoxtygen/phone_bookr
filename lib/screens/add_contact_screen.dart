import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_data.dart';
import 'package:provider/provider.dart';

class AddContactScreen extends StatefulWidget {
  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          padding: EdgeInsets.only(
            top: 60.0,
            right: 20.0,
            bottom: 30.0,
            left: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "New Contact",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        Container(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "First Name",
                            hintText: "Enter first name"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'First name field cannot be blank';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          firstName = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Last Name",
                            hintText: "Enter last name"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Last name field cannot be blank';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          lastName = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            icon: Icon(Icons.phone_android),
                            labelText: "Phone Number",
                            hintText: "Enter phone number"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Phone number field cannot be blank';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // print("All form fields are okay");
                            // print(firstName);
                            // print(lastName);
                            // print(phoneNumber);
                            Provider.of<ContactData>(context, listen: false)
                                .addContact(firstName, lastName, phoneNumber);
                            Navigator.pop(context);
                          }
                        },
                        child: Text("SUBMIT"),
                      ),
                    ),
                  ],
                )))
      ],
    );
  }
}
