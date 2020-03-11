import 'package:cloud_firestore/cloud_firestore.dart';

class Challenge{
  final String title;
  final String description;
  final DateTime end;
  final DocumentReference reference;

  Challenge.fromMap(Map<String, dynamic> map,  {this.reference})
     : assert(map['title'] != null),
       assert(map['description'] != null),
       assert(map['end'] != null),
       title = map['title'],
       description = map['description'],
       end = map['end'].toDate();

  Challenge.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Challenge<$title:$end>";
}