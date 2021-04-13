import 'package:flutter/material.dart';

 popUpMenu({List<String> linkActions, onSelectAction}) {
  return Align(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: PopupMenuButton(
        itemBuilder: (BuildContext context) {
          return linkActions.map((String action) {
            PopupMenuItem(
              child: Text(action),
              value: action,
            );
          }).toList();
        },
        elevation: 4.5,
        onSelected: onSelectAction,
      ),
    ),
  );
}
