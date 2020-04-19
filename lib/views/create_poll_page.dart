import 'package:flutter/material.dart';
import 'package:votingapp/contracts/create_poll_contract.dart';
import 'package:votingapp/models/poll.dart';
import 'package:votingapp/presenters/create_poll_presenter.dart';

class CreatePollPage extends StatefulWidget {
  @override
  _CreatePollPageState createState() => new _CreatePollPageState();
}

class _CreatePollPageState extends State<CreatePollPage> implements View {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _newOptionController = TextEditingController();

  CreatePollPresenter _presenter;
  List<String> _options;

  @override
  void initState() {
    super.initState();
    _presenter = new CreatePollPresenter(this);
    _options = new List<String>();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Create Poll",
            style: TextStyle(fontWeight: FontWeight.w500)
        ),
      ),
      body: _buildForm()
    );
  }

  Widget _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "Title of the poll"
                ),
                validator: (value) {
                  return value.isEmpty ? "Please enter a title for the poll" : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: "Description of the poll"
                ),
                validator: (value) {
                  return value.isEmpty ? "Please enter a description for the poll" : null;
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemCount: _options.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(_options[index]);
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _newOptionController,
                      decoration: InputDecoration(
                        hintText: "New option"
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: RaisedButton(
                      child: Text("Add option"),
                      onPressed: () {
                        if (_newOptionController.text.isNotEmpty) {
                          setState(() {
                            _options.add(_newOptionController.text);
                          });
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    String title = _titleController.text;
                    String desc = _descriptionController.text;
                    Poll poll = new Poll(title, desc, _options);
                    _presenter.sendPoll(poll);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        )
    );
  }
}
