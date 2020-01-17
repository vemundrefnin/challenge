import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewChallengeFormBody extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptonController = TextEditingController();
  final intervallController = TextEditingController();
  final friendsController = TextEditingController();
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();
  final FocusNode _intervallFocus = FocusNode();
  final FocusNode _friendsFocus = FocusNode();
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<NewPostFormState>.
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
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
              controller: titleController,
              textInputAction: TextInputAction.next,
              focusNode: _titleFocus,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _titleFocus, _descriptionFocus);
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  // hintText: 'Enter a search term',
                  labelText: 'Challenge title'),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
              controller: descriptonController,
              textInputAction: TextInputAction.next,
              focusNode: _descriptionFocus,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _descriptionFocus, _intervallFocus);
              },
              decoration: InputDecoration(
                  border: InputBorder.none, labelText: 'Description'),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter an intervall';
                }
                return null;
              },
              controller: intervallController,
              textInputAction: TextInputAction.next,
              focusNode: _intervallFocus,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _intervallFocus, _friendsFocus);
              },
              decoration: InputDecoration(
                  border: InputBorder.none, labelText: 'Intervall'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter name of friends to challenge';
                }
                return null;
              },
              controller: friendsController,
              textInputAction: TextInputAction.unspecified,
              focusNode: _friendsFocus,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  // hintText: 'Enter a search term',
                  labelText: 'Challenge friends'),
            ),
            DateTimeField(
              format: format,
              decoration: InputDecoration(
                  border: InputBorder.none, labelText: 'End date'),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                        // new Future.delayed(const Duration(seconds: 1), () => "1");
                        // Firestore.instance
                        //   .collection('posts')
                        //   .add({
                        //     "title": myController.text,
                        //     'end': DateTime.now(),
                        //     'description': 'test'
                        // })
                        // .then((result) => {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Challange created')));
                        //   Navigator.pop(context),
                        //   // taskTitleInputController.clear(),
                        //   // taskDescripInputController.clear(),
                        // })
                        // .catchError((err) => {
                        // print(err);
                        // Scaffold.of(context)
                        //   .showSnackBar(SnackBar(content: Text('Error, challange was not created')));
                        // });

                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _fieldFocusChange(BuildContext context, currentFocus, nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
