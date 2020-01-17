import 'package:challenge/pages/newChallenge/new_challange_screen.dart';
import 'package:challenge/pages/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class ChallengeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Challange'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, 'profile');
            },
          ),
          ListTile(
            title: Text('Add friends'),
            leading: Icon(Icons.person_add),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Create challenge'),
            leading: Icon(Icons.add_box),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                return NewChallengeForm();
              }, transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                return new FadeTransition(opacity: animation, child: child);
              }));
            },
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                return Settings();
              }, transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                return new FadeTransition(opacity: animation, child: child);
              }));
            },
          ),
        ],
      ),
    );
  }
}
