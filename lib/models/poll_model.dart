
import 'package:firebase_database/firebase_database.dart';
import 'package:votingapp/contracts/poll_contract.dart';
import 'package:votingapp/models/poll.dart';

class PollModel implements Model {

  Poll _poll;
  DatabaseReference ref = FirebaseDatabase.instance.reference().child("polls");

  @override
  void setPoll(Poll poll) {
    this._poll = poll;
  }

  @override
  void vote(String vote) {
    ref.child(_poll.uid).child("options").child(vote).runTransaction((MutableData transaction) async {
      transaction.value = (transaction.value ?? 0) + 1;
      return transaction;
    });
  }
}