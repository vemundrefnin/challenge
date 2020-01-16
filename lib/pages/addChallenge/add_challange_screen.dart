
import 'package:challenge/pages/addChallenge/components/new_challange_form_body.dart';
import 'package:flutter/material.dart';

class NewChallengeForm extends StatefulWidget {
  @override
  NewChallengeFormState createState() {
    return NewChallengeFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class NewChallengeFormState extends State<NewChallengeForm> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('New challenge'),
        ),
        body: NewChallengeFormBody(),
      );
  }
}

