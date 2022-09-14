import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/chats.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(8),
          title: Text(
            "My status",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text("Tap to add status update"),
        ),
        Padding(
          padding: EdgeInsets.only(left: 14, top: 0),
          child: Text(
            "Recent updates",
            style: TextStyle(
                fontSize: 12,
                letterSpacing: 0.3,
                fontWeight: FontWeight.w500,
                color: Color(0xFF595B5C)),
          ),
        ),
        ListView.builder(
          itemCount:_items.length ,
          itemBuilder: ((context, index) {
          return ListTile();
        }))
      ],
    );
  }
}
