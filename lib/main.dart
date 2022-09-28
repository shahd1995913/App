import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Plant App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Color(0xff204f1c),
        ),
        body: const MyStatefulWidget(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: <Widget>[
            Image.network(
                'https://cdn-icons-png.flaticon.com/512/628/628283.png',
                width: 40,
                height: 40,
                alignment: Alignment.topCenter),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Plants that produce grain, fruit, and vegetables also form basic human foods and have been domesticated for millennia',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Join Plant App Today.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )),
            Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    print(nameController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signup()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff204f1c),
                    onPrimary: Colors.white,
                    shape: StadiumBorder(),
                  ),
                )),
            Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: const Text('Log In'),
                  onPressed: () {
                    print(nameController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Color(0xff204f1c),
                    shape: StadiumBorder(),
                  ),
                )),
          ],
        ));
  }
}
