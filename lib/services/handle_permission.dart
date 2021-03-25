import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phone_bookr/screens/all_contact.dart';
import 'package:flutter/cupertino.dart';

class HandlePermission extends StatefulWidget {
  @override
  _HandlePermissionState createState() => _HandlePermissionState();
}

class _HandlePermissionState extends State<HandlePermission> {
  void initState() {
    super.initState();
    checkPermission();
  }

  //Check contacts permission
  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }

  Future checkPermission() async {
    final PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AllContact()));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
                title: Text("Permissions Error"),
                content: Text(
                    "Please enable contact access permission in system settings"),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text("OK"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text("Phone BookR"),
            ),
          )
        ],
      ),
    );
  }
}
