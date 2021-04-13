import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({
    @required this.onTap,
    @required this.icon,
    @required this.iconText,
  });
  final GestureTapCallback onTap;
  final IconData icon;
  final String iconText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                Text(iconText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
