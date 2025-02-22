import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag: 'uk.png',
        time: '',
        isDayTime: false),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag: 'greece.png',
        time: '',
        isDayTime: false),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag: 'egypt.png',
        time: '',
        isDayTime: false),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png',
        time: '',
        isDayTime: false),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag: 'usa.png',
        time: '',
        isDayTime: false),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'usa.png',
        time: '',
        isDayTime: false),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag: 'south_korea.png',
        time: '',
        isDayTime: false),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png',
        time: '',
        isDayTime: false),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 4,
            ),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
