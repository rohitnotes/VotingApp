
import 'package:votingapp/contracts/poll_contract.dart';
import 'package:votingapp/models/poll.dart';
import 'package:votingapp/models/poll_model.dart';

class PollPresenter implements Presenter {

  Model _model;
  View _view;

  PollPresenter(this._view) {
    this._model = PollModel();
  }

  @override
  void setPoll(Poll poll) {
    _model.setPoll(poll);
  }

  @override
  void vote(String vote) {
    _model.vote(vote);
  }


}