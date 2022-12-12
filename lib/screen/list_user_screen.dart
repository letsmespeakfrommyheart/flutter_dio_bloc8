import 'package:dio/dio.dart';
import 'package:flutter_dio_bloc8/model/list_user_response.dart';
import 'package:flutter/material.dart';

import '../services/list_user_api_provider.dart';

class ListUserScreen extends StatefulWidget {
  const ListUserScreen({super.key});

  @override
  ListUserScreenState createState() => ListUserScreenState();
}

class ListUserScreenState extends State<ListUserScreen> {
  bool isLoading = false;
  late ListUserProvider http;
  late ListUserResponse listUserResponse;
  late List<User> users;

  Future getListUser() async {
    Response response;
    try {
      isLoading = true;
      response = await http.getRequest();
      isLoading = false;

      if (response.statusCode == 200) {
        setState(() {
          listUserResponse = ListUserResponse.fromJson(response.data);
          users = listUserResponse.users;
        });
      } else {
        debugPrint(response.statusCode.toString());
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    http = ListUserProvider();
    getListUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Get list of users")),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : users != null
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Card(
                          shadowColor: Colors.grey,
                          child: ListTile(
                              title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(user.firstName),
                                    const SizedBox(width: 5),
                                    Text(user.lastName)
                                  ]),
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(user.avatar),
                                  radius: 50),
                              subtitle: Column(children: [Text(user.email)]),
                              trailing: const Icon(Icons.call_made_rounded)));
                    },
                    itemCount: users.length)
                : const Center(child: Text("No User Object")));
  }
}
