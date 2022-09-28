import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'Channel.dart';
import 'model.dart';

void main() {
  runApp(Mune());
}

class Mune extends StatelessWidget {
  const Mune({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xff134915),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  controller: _controller,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.home_outlined),
                      text: "Detect",
                    ),
                    Tab(
                      icon: Icon(Icons.auto_stories_outlined),
                      text: "Rare",
                    ),
                    Tab(
                      icon: Icon(Icons.auto_awesome_outlined),
                      text: "Poisonous",
                    ),
                  ],
                ),
              ))),
      body: TabBarView(
        children: [Modeldeep(), Feed(), Channel()],
        controller: _controller,
      ),
    );
  }
}
