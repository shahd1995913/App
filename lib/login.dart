import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'signup.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'homepage.dart';
import 'homeone.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Color(0xff204f1c),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/628/628283.png',
            width: 40,
            height: 80,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mobile_friendly,
              ),
              hintText: "Phone number",
            ),
            // The validator receives the text that the user has entered.

            validator: (value) {
              Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
              RegExp regex = new RegExp(pattern.toString());
              if (value == null || value.isEmpty) {
                return 'Please enter Phone number';
              } else if (!regex.hasMatch(value)) {
                return 'Enter Valid Phone Number';
              }

              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.password,
              ),
              hintText: "Password",
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Password';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Mune()));
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
