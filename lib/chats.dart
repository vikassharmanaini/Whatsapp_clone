import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';

class chates extends StatefulWidget {
  const chates({super.key});

  @override
  State<chates> createState() => _chatesState();
}

class _chatesState extends State<chates> {
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
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          // return ListTile(
          //   title: Text("fu"),
          // );
          return chatelisttile(
            name: _items[index]["name"],
            lastchat: _items[index]["l_chat"],
            Imageurl: _items[index]["image"],
          );
        });
  }
}

class chatelisttile extends StatefulWidget {
  const chatelisttile(
      {super.key,
      required this.name,
      required this.lastchat,
      required this.Imageurl});

  final String name;
  final String lastchat;
  final String Imageurl;
  @override
  State<chatelisttile> createState() =>
      _chatelisttileState(name, lastchat, Imageurl);
}

class _chatelisttileState extends State<chatelisttile> {
  String name;
  String lastchat;
  String Imageurl;

  _chatelisttileState(this.name, this.lastchat, this.Imageurl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          debugPrint(name);
        });
      },
      tileColor: Colors.white,
      leading: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(
          color: Colors.green,
        ),
        imageUrl: Imageurl,
        cacheKey: Imageurl,
        imageBuilder: (context, imageProvider) => Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      subtitle: Text(lastchat),
    );
  }
}
