import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Container(
          child: Text(
            'drawer',
          ),
        ),
      ),
    );
  }
}
