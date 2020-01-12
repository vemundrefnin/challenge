import 'package:challenge/screens/addChallange/add_challange_screen.dart';
import 'package:challenge/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
 @override
 _MyHomePageState createState() {
   return _MyHomePageState();
 }
}

class _MyHomePageState extends State<MyHomePage> {
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
     body: Body(),
     floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: (){
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => NewPostForm()),
            // );
          },
      ),
   );
 }
}
