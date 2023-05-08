import 'package:flutter/material.dart';
import 'package:mysports/authentication/userdetails.dart';

class user_drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Row(
              children: [
                const Icon(Icons.person),
                Text(details.name!),
              ],
            ),
            accountEmail: Row(
              children: [
                const Icon(Icons.email),
                Text(details.email!),
              ],
            ),
          )
        ],
      ),
    );
  }
}
