
import 'package:challenge/screens/addChallange/components/body.dart';
import 'package:flutter/material.dart';

class NewPostForm extends StatefulWidget {
  @override
  NewPostFormState createState() {
    return NewPostFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class NewPostFormState extends State<NewPostForm> {
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Body(),
      );
  }
}
