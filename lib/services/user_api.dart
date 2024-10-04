import 'dart:convert';
import 'package:flutter_api_call/model/user.dart';
import 'package:flutter_api_call/model/user_dob.dart';
import 'package:flutter_api_call/model/user_name.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print("Fetch User Fuction Call....");

    const url = "https://randomuser.me/api/?results=5";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results =
        json["results"] as List<dynamic>; // url first key values is results
    final users = results.map((e) {
      final name = UserName(
          title: e["name"]["title"],
          first: e['name']['first'],
          last: e['name']['last']);
      final date = e['dob']['date'];
      final dob = UserDob(date: DateTime.parse(date), age: e['dob']['age']);
      return User(
          gender: e["gender"],
          email: e["email"],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat'],
          name: name,
          dob: dob);
    }).toList();
    return users;
    // print("Fetch Users Data Complated....!!!!");
  }
}
