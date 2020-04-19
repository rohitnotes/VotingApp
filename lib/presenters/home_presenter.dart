import 'package:votingapp/contracts/home_contract.dart';
import 'package:votingapp/models/home_model.dart';

import 'dart:async';

import 'package:votingapp/models/poll.dart';

class HomePresenter implements Presenter {

  Model _model;
  View _view;

  HomePresenter(this._view) {
    this._model = HomeModel();
  }

  @override
  Future viewDisplayed() async {
    List<Poll> items = await _model.getItems();
    _view.showItems(items);
  }
}