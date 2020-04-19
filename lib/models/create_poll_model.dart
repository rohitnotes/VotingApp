
import 'package:firebase_database/firebase_database.dart';
import 'package:votingapp/contracts/create_poll_contract.dart';
import 'package:votingapp/models/poll.dart';

class CreatePollModel implements Model {

  DatabaseReference _ref;

  CreatePollModel() {
    _ref = FirebaseDatabase.instance.reference().child("polls");
  }

  @override
  void sendPoll(Poll poll) {
    String postId = _ref.push().key;
    _ref.child(postId).set({
      'title': poll.title,
      'description': poll.description,
      'options': poll.options,
      'uid': postId
    });
  }

}