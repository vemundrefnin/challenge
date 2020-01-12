import 'package:cloud_firestore/cloud_firestore.dart';

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