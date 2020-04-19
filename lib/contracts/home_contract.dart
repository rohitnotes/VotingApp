
import 'package:votingapp/models/poll.dart';

abstract class View {
  void showItems(List<Poll> items);
}

abstract class Model {
  Future<List<Poll>> getItems();
}

abstract class Presenter {
  Future viewDisplayed();
}
