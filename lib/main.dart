import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone/calls.dart';
import 'package:whatsapp_clone/camera.dart';
import 'package:whatsapp_clone/chats.dart';
import 'package:whatsapp_clone/status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      animationDuration: Duration(milliseconds: 200),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF55A058),
          title: Text('WhatsApp'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 2.0,
            tabs: [
              IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
              Tab(
                text: "Chats",
              ),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
          ),
        ),
        body: TabBarView(children: [Camera(), chates(), Status(), Calls(),]),
      ),
    );
  }
}
