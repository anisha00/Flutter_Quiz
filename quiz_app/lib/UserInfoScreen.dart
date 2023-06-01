import 'package:flutter/material.dart';
import 'package:quiz_app/QuestionEntry.dart';

class UserInfoScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'quiz.jpg',
              width: 80,
            ),
            Center(
              child: Text(
                'Lets play',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.purple.shade600),
              ),
            )
          ],
        ),
        shadowColor: Colors.purple,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter unserName';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("username"),
                    hintText: "Enter your userename",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    final bool emailValid = RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value!);
                    if (value!.isEmpty) {
                      return 'Please enter Email';
                    } else if (emailValid == false) {
                      return 'please enter valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Email"),
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    final bool phoneValid =
                        RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value!);
                    if (value!.isEmpty) {
                      return 'Please enter Phone Number';
                    } else if (phoneValid == false) {
                      return 'Please enter valid numbers';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Phone No."),
                    hintText: "Enter your Phone number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => {
                      if (_formKey.currentState!.validate()) debugPrint("Valid")
                    },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
