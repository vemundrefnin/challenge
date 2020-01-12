import 'package:challenge/models/Post.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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


