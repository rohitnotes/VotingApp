import 'package:firebase_database/firebase_database.dart';
import 'package:votingapp/contracts/home_contract.dart';
import 'package:votingapp/models/poll.dart';


class HomeModel implements Model {

  List<Poll> _polls;
  DatabaseReference _ref;

  HomeModel() {
    _polls = new List<Poll>();
    _ref = FirebaseDatabase.instance.reference();
  }

  @override
  Future<List<Poll>> getItems() async {
    await _ref.child("polls").once().then((DataSnapshot globalSnap) {
      _polls.clear();
      Map<dynamic, dynamic> values = globalSnap.value;
      values.forEach((key, value) {
        if (value != null) {
          _polls.add(new Poll.fromJson(value));
        }
      });
    });

    return _polls;
  }
}