
import 'package:votingapp/contracts/create_poll_contract.dart';
import 'package:votingapp/models/create_poll_model.dart';
import 'package:votingapp/models/poll.dart';

class CreatePollPresenter implements Presenter {

  Model _model;
  View _view;

  CreatePollPresenter(this._view) {
    _model = CreatePollModel();
  }

  @override
  void sendPoll(Poll poll) {
    _model.sendPoll(poll);
  }
}