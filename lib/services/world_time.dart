import 'dart:ffi';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location;
  String flag;
  String url;

  WorldTime({ required this.location, required this.flag, required this.url});

  //bujena vane: https://protocoderspoint.com/flutter-null-safety-example-handle-null-exception/#:~:text=In%20Flutter%20late%20keyword%20will%20lets%20you%20use,the%20value%20to%20variable%20later%20on%20in%20future.
  late String time;
  late bool daytime;
  Future<void> getTime() async {
    try{
  Response response = await get(Uri.parse('https://www.timeapi.io/api/Time/current/zone?timeZone=$url'));
  Map data = jsonDecode(response.body);

  String initialtime = data['time'];
  DateTime temp= DateFormat("h:mm").parse(initialtime);
  time = DateFormat('h:mm a').format(temp);

  int hour = data['hour'];
  daytime = hour>6 && hour< 18 ? true:false;
    }
    catch(e)
    {
      print('Found an error ------>  $e');
      time=("Error.Please wait...");
    }
  }

}