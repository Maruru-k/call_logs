import 'package:call_logs/model/user.dart';
import 'package:call_logs/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CallInfo extends StatelessWidget {
  const CallInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.orange[300],
          child: FutureBuilder<http.Response>(
              future: http.get(Uri.parse("https://reqres.in/api/users/3")),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = json.decode(snapshot.data!.body)["data"];
                  User user = User.fromJson(data);
                  return ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    children: [
                      UserCard(user: user),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(radius: 80, backgroundImage: NetworkImage(user.avatar)),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user.firstName + " " + user.lastName,
                  style: AppTextStyle.bold17()),
            ],
          ),
          const SizedBox(height: 8),
          Text(user.email, style: AppTextStyle.regular15()),
        ],
      ),
    );
  }
}
