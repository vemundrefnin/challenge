import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _notifications = true;
  var _notificationsIcon = Icons.notifications;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SwitchListTile(
        title: const Text('Notification'),
        value: _notifications,
        onChanged: (bool value) {
          setState(() {
            _notifications = value;
            _notificationsIcon = value ? Icons.notifications : Icons.notifications_off;
          });
        },
        secondary: Icon(_notificationsIcon),
      ),
    );
  }
}
