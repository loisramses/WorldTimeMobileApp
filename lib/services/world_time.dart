import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // the url to an asset flag icon
  String url; // the url for api endpoint
  bool isDayTime; // true or false if daytime or not

  WorldTime({
    required this.location,
    required this.time,
    required this.flag,
    required this.url,
    required this.isDayTime,
  });

  Future<void> getTime() async {
    try {
      var getUrl =
          Uri.https('timeapi.io', '/api/timezone/zone', {'timezone': url});
      var response = await http.get(getUrl);
      Map data = jsonDecode(response.body);
      var datetime = data['currentLocalTime'];
      var offset = data['standardUtcOffset']['seconds'];
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(seconds: offset));

      isDayTime = now.hour >= 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'Failed to fetch time';
    }
  }
}
