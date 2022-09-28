import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'homepage.dart';
import 'login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'homeone.dart';

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Signup';

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

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String gender = "male";
  @override
  Widget build(BuildContext context) {
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
                Icons.email,
              ),
              hintText: "Email",
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              final bool isValid = EmailValidator.validate(value.toString());
              if (value == null || value.isEmpty) {
                return 'Please enter Email';
              } else if (isValid == false) {
                return 'Please enter Valid Email';
              }

              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
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
          Icon(
            Icons.male,
            color: Colors.grey,
            size: 30,
          ),
          Text(
            "Gender",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          RadioListTile(
            title: Text("Female"),
            value: "female",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            },
          ),
          RadioListTile(
              title: Text("Male"),
              value: "male",
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString();
                });

                // The validator receives the text that the user has entered.
              }),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.numbers_sharp,
              ),
              hintText: "Age",
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              // var ageval = int.parse(value);

              if (value == null || value.isEmpty) {
                return 'Please enter Age';
              } else if (int.parse(value) < 16 || int.parse(value) > 100) {
                return 'Please enter Vaild Age';
              }

              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.important_devices,
              ),
              hintText: "ID number",
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
              RegExp regex = new RegExp(pattern.toString());
              if (value == null || value.isEmpty) {
                return 'Please enter ID number';
              } else if (!regex.hasMatch(value)) {
                return 'Enter Valid ID number';
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
              } else if (value.length < 8) {
                return 'Please enter Vaild Password';
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
