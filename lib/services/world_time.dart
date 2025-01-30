import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // the url to an asset flag icon
  String url; // the url for api endpoint

  WorldTime({
    required this.location,
    required this.time,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    var url = Uri.https(
        'timeapi.io', '/api/timezone/zone', {'timezone': 'Europe/London'});
    var response = await http.get(url);
    Map data = jsonDecode(response.body);
    var datetime = data['currentLocalTime'];
    var offset = data['standardUtcOffset']['seconds'];
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(seconds: offset));
    time = now.toString();
  }
}
