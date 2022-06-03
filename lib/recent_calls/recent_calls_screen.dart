import 'dart:convert';

import 'package:call_logs/model/call.dart';
import 'package:flutter/material.dart';
import 'package:call_logs/recent_calls/call_item.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:call_logs/styles/colors.dart';

class RecentCalls extends StatefulWidget {
  final String url =
      "https://raw.githubusercontent.com/Gammadov/data/main/calls/call_logs.json";

  const RecentCalls({Key? key}) : super(key: key);

  @override
  State<RecentCalls> createState() => _RecentCallsState();
}

class _RecentCallsState extends State<RecentCalls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColor.appBar,
        title: const Text(
          'Журнал звонков',
          style: TextStyle(color: AppColor.primary),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: AppColor.appBar,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: FutureBuilder<http.Response>(
          future: http.get(Uri.parse(widget.url)),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List decoded = jsonDecode(snapshot.data!.body);
              List<Call> calls = decoded.map((e) => Call.fromJson(e)).toList();

              return ListView.separated(
                itemBuilder: (_, index) => CallCard(call: calls[index]),
                separatorBuilder: (_, __) => const Divider(
                    thickness: 0.5, height: 0.5, color: AppColor.tertiary),
                itemCount: calls.length,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
