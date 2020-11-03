import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  @override
  Widget build(BuildContext context) {
    String firstName;
    String lastName;
    String phoneNumber;
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "New Contact",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Icon(
                Icons.cancel,
                size: 30.0,
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print("All form fields are okay");
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
