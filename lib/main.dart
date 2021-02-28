import 'package:flutter/material.dart';
import 'package:phone_bookr/models/contact_data.dart';
import 'package:phone_bookr/screens/contacts_screen.dart';
import 'package:phone_bookr/screens/favorite_contact_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: DefaultTabController(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Contacts"),
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    icon: Icon(Icons.contact_phone),
                    text: "Contacts",
                  ),
                  Tab(
                    icon: Icon(Icons.star_rate),
                    text: "Favorites",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ContactsScreen(),
                FavoriteContactScreen(),
              ],
            ),
          ),
          length: 2,
        ),
      ),
    );
  }
}
