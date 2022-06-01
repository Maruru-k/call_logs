import 'package:call_logs/model/call.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CallInfo extends StatelessWidget {
  const CallInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange[300],
        child: FutureBuilder<http.Response>(
            future: http
                .get(Uri.parse("https://jsonplaceholder.typicode.com/users")),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map parsed = json.decode(snapshot.data!.body);
                List<Call> call = List.generate(
                    parsed.length, (index) => Call.fromJson(parsed[index]));
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Text(call[0].phone),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
