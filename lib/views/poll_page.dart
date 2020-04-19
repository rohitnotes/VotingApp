import 'package:flutter/material.dart';
import 'package:votingapp/contracts/poll_contract.dart';
import 'package:votingapp/models/poll.dart';
import 'package:votingapp/presenters/poll_presenter.dart';

class PollPage extends StatefulWidget {
  @override
  _PollPageState createState() => new _PollPageState();
}

class _PollPageState extends State<PollPage> implements View {

  String _selectedRadioOption = "";
  PollPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = new PollPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    Poll poll = ModalRoute.of(context).settings.arguments;
    _presenter.setPoll(poll);

    return new Scaffold(
      appBar: new AppBar(
        title:
            new Text(poll.title, style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: _buildBody(poll),
    );
  }

  Widget _buildBody(Poll poll) {
    List<String> options = poll.options.keys.toList();
    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(poll.description),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                    title: Text(options[index]),
                    value: options[index],
                    groupValue: _selectedRadioOption,
                    onChanged: (option) => setState(() => _selectedRadioOption = option),
                );
              }),
        ),
        RaisedButton(
          child: Text("Vote"),
          onPressed: () => _presenter.vote(_selectedRadioOption),
        )
      ],
    );
  }
}
