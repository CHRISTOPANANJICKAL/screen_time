import 'dart:convert';
import 'package:blocstudy/DataModel/data_model.dart';
import 'package:blocstudy/DataModel/error_catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

fetchData() async {
  String url =  "http://api.mocklets.com/mock68182/screentime";
  try{
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      int totalTime = int.parse(data[0]['chartData']['totalTime']['total']);
      int studyTime = int.parse(data[0]['chartData']['studyTime']['total']);
      int classTime = int.parse(data[0]['chartData']['classTime']['total']);
      int freeTime = int.parse(data[0]['chartData']['freeTime']['total']);
      int freeTimeMaxUsage = int.parse(data[0]['freeTimeMaxUsage']);
      int deviceUsageTotalTimeMobile = int.parse(data[0]['deviceUsage']['totalTime']['mobile']);
      int deviceUsageTotalTimeLaptop = int.parse(data[0]['deviceUsage']['totalTime']['laptop']);
      DataModel dataModel = DataModel(totalTime,studyTime,classTime,freeTime,freeTimeMaxUsage,deviceUsageTotalTimeMobile,deviceUsageTotalTimeLaptop);
      return dataModel ;
    }
    // else {
    //   return
    //   throw Exception('Failed to load album');
    // }

  }catch(r){
    ErrorCatcher.setError(r.toString());
    return debugPrint(r.toString());
  }

}




String formatDuration(Duration d) {
  var seconds = d.inSeconds;
  final days = seconds~/Duration.secondsPerDay;
  seconds -= days*Duration.secondsPerDay;
  final hours = seconds~/Duration.secondsPerHour;
  seconds -= hours*Duration.secondsPerHour;
  final minutes = seconds~/Duration.secondsPerMinute;
  seconds -= minutes*Duration.secondsPerMinute;

  final List<String> tokens = [];
  if (days != 0) {
    tokens.add('${days}d');
  }
  if (tokens.isNotEmpty || hours != 0){
    tokens.add('${hours}h');
  }
  if (minutes != 0) {
    tokens.add('${minutes}m');
  }
  if (tokens.isNotEmpty && seconds != 0) {
    tokens.add('${seconds}s');
  }

  return tokens.join(' ');
}

// formatDuration(Duration(minutes:(