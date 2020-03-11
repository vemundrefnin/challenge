import 'package:challenge/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  FluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseUser user=null;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
            // FirebaseUser user = snapshot.data; // this is your user instance
          if (snapshot.hasData) {
            /// is because there is user already logged
            return MaterialApp(
                title: 'Challenge',
                initialRoute: 'home',
                onGenerateRoute: FluroRouter.router.generator
                //  theme: appTheme(),
                );
          }

          /// other way there is no user logged.
          return MaterialApp(
              title: 'Challenge',
              initialRoute: 'login',
              onGenerateRoute: FluroRouter.router.generator
              );
        });
  }
}
