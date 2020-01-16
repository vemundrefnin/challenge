import 'package:challenge/pages/addChallenge/add_challange_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'pages/home/home_screen.dart';

class FluroRouter {
  static Router router = Router();
  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => MyHomePage());
  static Handler _newChallengeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => NewChallengeForm());
  static void setupRouter() {
    router.define(
      'new-challenge',
      handler: _newChallengeHandler,
    );
    router.define(
      'home',
      handler: _homeHandler,
    );
  }
}