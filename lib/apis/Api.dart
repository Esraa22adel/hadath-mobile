import 'dart:convert';
import '../models/session.dart';
import '../models/sharedData.dart';
import '../models/event.dart';
import '../models/user.dart';
import 'package:http/http.dart';

class API {
  static const String _BASE_URL = 'https://moh.hadath.app/json';

  static Future<List<ShardData>> getAllSpeakers() async {
    //business logic to send data to server
    final Response response = await get('$_BASE_URL/speakers');

    if (response.statusCode == 200) {
      print(response.body);
      //parse json into list of objects
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<ShardData>((item) => ShardData.fromJson(item)).toList();
      //return Author.fromJson(json.decode(response.body));
    } else {
      print('Error');
      throw Exception("Can't load author");
    }
  }

  static Future<List<ShardData>> getAllSponsers() async {
    final Response response = await get('$_BASE_URL/sponsors?_format=json');
    if (response.statusCode == 200) {
      // print(response.body);
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<ShardData>((item) => ShardData.fromJson(item)).toList();
    } else {
      print("error");
      throw Exception("Can't load author");
    }
  }

  static Future<List<Session>> getAllSessions() async {
    final Response response = await get('$_BASE_URL/sessions?_format=json');
    if (response.statusCode == 200) {
      //  print(response.body);
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Session>((item) => Session.fromJson(item)).toList();
    } else {
      print(response);

      throw Exception('Request Error: ${response.statusCode}');

      // print("error");
    }
  }

  static Future<List<Event>> getAllEvent() async {
    final Response response = await get('$_BASE_URL/event?_format=json');
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Event>((item) => Event.fromJson(item)).toList();
    } else {
      print(response);

      throw Exception('Request Error: ${response.statusCode}');

      // print("error");
    }
  }
  static Future<User> login(User user) async {
    //business logic to send data to server
    final Response response = await post('https://moh.hadath.app/user/login?_format=json',
        // headers: <String, String>{
        //   'Content-Type': 'application/json;charset=UTF-8'
        // },
        body: jsonEncode(user.toJson()));

    if (response.statusCode == 200) {
            print("the response is");

      print(response.body);
      return User.fromJson(json.decode(response.body));
    } else {
      //print('Error');
      throw Exception("Can't load author");
    }
  }
}
