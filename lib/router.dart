import 'package:challenge/pages/login/login_screen.dart';
import 'package:challenge/pages/newChallenge/new_challange_screen.dart';
import 'package:challenge/pages/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'pages/home/home_screen.dart';

class FluroRouter {
  static Router router = Router();
  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => MyHomePage());
  static Handler _newChallengeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => NewChallengeForm());
  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => Login());
  static Handler _profileHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => Profile());
  static void setupRouter() {
    router.define(
      'new-challenge',
      handler: _newChallengeHandler,
    );
    router.define(
      'home',
      handler: _homeHandler,
    );
    router.define(
      'login',
      handler: _loginHandler,
    );
    router.define(
      'profile',
      handler: _profileHandler,
    );
  }
}