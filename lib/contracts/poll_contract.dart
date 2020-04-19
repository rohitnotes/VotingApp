
import 'package:votingapp/models/poll.dart';

abstract class View {
}

abstract class Model {
  void setPoll(Poll poll);
  void vote(String vote);
}

abstract class Presenter {
  void setPoll(Poll poll);
  void vote(String vote);
}