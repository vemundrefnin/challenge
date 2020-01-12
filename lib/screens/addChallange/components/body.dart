import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<NewPostFormState>.
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");
  final myController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child:  Builder(
        builder: (context) => 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Pleas enter a challenge title';
              }
              return null;
            },
            controller: myController,
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: 'Enter a search term',
              labelText: 'Challenge title'
            ),
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: 'Enter a search term',
              labelText: 'Description'
            ),
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a ...';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: 'Enter a search term',
              labelText: 'Intervall'
            ),
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: 'Enter a search term',
              labelText: 'Challenge friends'
            ),
          ),
          DateTimeField(
            format: format,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'End date'
            ),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));

            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)  
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  // Firestore.instance
                  //   .collection('posts')
                  //   .add({
                  //     "title": myController.text,
                  //     'end': DateTime.now(),
                  //     'description': 'test'
                  // })
                  // .then((result) => {
                  //   Navigator.pop(context),
                  //   // taskTitleInputController.clear(),
                  //   // taskDescripInputController.clear(),
                  // })
                  // .catchError((err) => print(err));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    ),
    );
  }
}