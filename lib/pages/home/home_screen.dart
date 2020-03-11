import 'package:challenge/models/Challenge.dart';
import 'package:challenge/widgets/challenge_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges'),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'new-challenge');
        },
      ),
      drawer: ChallengeDrawer(),
    );
  }

  Widget buildBody() {
    _auth.currentUser().then((FirebaseUser user) {
      print(user.uid);

      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('challenges')
            .document('whn0VCWdU5Rv6TtP0sXiTpwqIjH3')
            .collection('userChallenges')
            .orderBy('end', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return _buildList(context, snapshot.data.documents);
        },
      );
    });
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final challenge = Challenge.fromSnapshot(data);
    String formattedDate = DateFormat('yyyy-MM-dd').format(challenge.end);

    return Padding(
      key: ValueKey(challenge.description),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(challenge.title),
          trailing: Text(formattedDate),
          onTap: () => print(challenge),
        ),
      ),
    );
  }
}
