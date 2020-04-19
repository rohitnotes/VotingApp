import 'package:flutter/material.dart';
import 'package:votingapp/contracts/home_contract.dart';
import 'package:votingapp/models/poll.dart';
import 'package:votingapp/presenters/home_presenter.dart';
import 'package:votingapp/views/create_poll_page.dart';
import 'package:votingapp/views/poll_page.dart';

//TODO: que votar aumente los votos y los muestre

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements View {
  List<Poll> _items;
  HomePresenter _presenter;
  bool _loadingInProgress;

  @override
  void initState() {
    super.initState();
    _loadingInProgress = true;
    _presenter = new HomePresenter(this);
    _presenter.viewDisplayed();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Voting App",
            style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabClicked,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildList() {
    if (_loadingInProgress) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: _items.map((Poll item) {
          return _buildListRow(item);
        }).toList(),
      );
    }
  }

  Widget _buildListRow(Poll item) {
    return new GestureDetector(
        onTap: () => _onTapListItem(item),
        child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(item.title,
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Total votes: "),
                    Text(item.getTotalVotes().toString())
                  ],
                )
              ],
            )));
  }

  @override
  void showItems(List<Poll> items) {
    setState(() {
      _items = items;
      _loadingInProgress = false;
    });
  }

  void _onTapListItem(Poll item) {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PollPage(),
                settings: RouteSettings(arguments: item)))
        .then((val) {
          _loadingInProgress = true;
          _items = null;
          _presenter.viewDisplayed();
    });
  }

  void _onFabClicked() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreatePollPage()))
        .then((val) {
          _loadingInProgress = true;
          _items = null;
          _presenter.viewDisplayed();
    });
  }
}
