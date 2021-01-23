import 'package:flutter/material.dart';

class CustomBottomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share contact'),
          onTap: () {
            print("You tapped me");
          },
        ),
        ListTile(
          leading: const Icon(Icons.copy),
          title: const Text('Copy'),
        ),
        ListTile(
          leading: Icon(Icons.delete),
          title: Text('Delete'),
          // onTap: delete,
        ),
        ListTile(
          leading: Icon(Icons.swap_horizontal_circle),
          title: Text('Create shortcut'),
        ),
        ListTile(
          leading: Icon(Icons.app_blocking),
          title: Text('Add to blacklist'),
        ),
      ],
    );
  }
}
