import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Challenge',
     home: MyHomePage(),
   );
 }
}

class MyHomePage extends StatefulWidget {
 @override
 _MyHomePageState createState() {
   return _MyHomePageState();
 }
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'challenge';
 @override
 Widget build(BuildContext context) { 
   return Scaffold(
     appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('challenge'),
      ),
     body: _buildBody(context),
     floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewPostForm()),
            );
          },
      ),
   );
 }

 Widget _buildBody(BuildContext context) {
 return StreamBuilder<QuerySnapshot>(
   stream: Firestore.instance.collection('posts').orderBy('end', descending: false).snapshots(),
   builder: (context, snapshot) {
     if (!snapshot.hasData) return LinearProgressIndicator();
     return _buildList(context, snapshot.data.documents);
   },
 );
}

 Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

 Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
   final post = Post.fromSnapshot(data);
   String formattedDate = DateFormat('yyyy-MM-dd').format(post.end);

   return Padding(
     key: ValueKey(post.description),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: ListTile(
         title: Text(post.title),
         trailing: Text(formattedDate),
         onTap: () => print(post),
       ),
     ),
   );
 }
}

// Define a custom Form widget.
class NewPostForm extends StatefulWidget {
  @override
  NewPostFormState createState() {
    return NewPostFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class NewPostFormState extends State<NewPostForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<NewPostFormState>.
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final myController = TextEditingController();
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Form(
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
                      Firestore.instance
                        .collection('posts')
                        .add({
                          "title": myController.text,
                          'end': DateTime.now(),
                          'description': 'test'
                      })
                      // .then((result) => {
                      //   Navigator.pop(context),
                      //   taskTitleInputController.clear(),
                      //   taskDescripInputController.clear(),
                      // })
                      .catchError((err) => print(err));
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
        ),
      );
  }
}



class Post{
  final String title;
  final String description;
  final DateTime end;
  final DocumentReference reference;

  Post.fromMap(Map<String, dynamic> map,  {this.reference})
     : assert(map['title'] != null),
       assert(map['description'] != null),
       assert(map['end'] != null),
       title = map['title'],
       description = map['description'],
       end = map['end'].toDate();

  Post.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Post<$description:$end>";
}
  
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}