
import 'package:votingapp/models/poll.dart';

abstract class View {

}

abstract class Model {
  void sendPoll(Poll poll);

}

abstract class Presenter {
  void sendPoll(Poll poll);
}