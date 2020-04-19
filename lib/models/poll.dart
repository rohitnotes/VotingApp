
import 'dart:collection';

class Poll {
  String _title;
  String _description;
  String _uid;
  HashMap<String, int> _options;

  Poll(this._title, this._description, List<String> options) {
    _options = new HashMap<String, int>();
    options.forEach((value) {
      _options[value] = 0;
    });
    print(_options);
  }

  Poll.fromJson(var ds) {
    this._title = ds["title"];
    this._description = ds["description"];
    this._uid = ds["uid"];
    _options = new HashMap<String, int>();
    Map<dynamic, dynamic> unParsedOptions = ds["options"];
    unParsedOptions.forEach( (k, v) {
      int value = v;
      _options[k] = value;
    });
  }

  String get title => _title;
  String get description => _description;
  String get uid => _uid;
  HashMap<String, int> get options => _options;
  
  int getTotalVotes() {
    int totalVotes = 0;
    for (var votes in _options.values) {
      totalVotes += votes;
    }
    return totalVotes;
  }
}