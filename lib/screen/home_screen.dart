import 'package:flutter/material.dart';
import 'package:flutter_api_call/services/user_api.dart';
import 'package:flutter_api_call/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest Api Call...!"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            // print(user);

            return ListTile(
              title: Text("Name :- ${user.fullName}  "),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email :- ${user.email}"),
                  Text("Phone :- ${user.phone}"),
                  Text("Gender :- ${user.gender}"),
                  Text("Date :- ${user.dob.date}"),
                  Text("Age :- ${user.dob.age}"),
                ],
              ),
            );
          }),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
