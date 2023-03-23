import 'package:flutter/material.dart';
import 'package:todolistapp/authscreen/authscreen.dart';

class Authform extends StatefulWidget {
  @override
  _authFormState createState() => _authFormState();
}

class _authFormState extends State<Authform> {
  final _formkey = GlobalKey<FormState>();
  var _email = "";
  var _password = "";
  bool isLoginPage = false;

  @override
  Widget build(BuildContext context) {
    // whenever there is a list. example ListView, their will either be children or child, most likely children
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  if (!isLoginPage)
                    TextFormField(
                        key: ValueKey('username'),
                        keyboardType: TextInputType.name,
                        // validates this TextFormField and makes sure it is not empty
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username is required.';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter UserName")),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      key: ValueKey('email'),
                      keyboardType: TextInputType.emailAddress,
                      // validates this TextFormField and makes sure it is not empty
                      validator: (value) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (!emailValid) {
                          return "Enter valid email address";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter Email Address")),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    key: ValueKey('password'),
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value!);
                      if (!emailValid) {
                        return "Enter valid Password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Password"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // this can be read as if this is the log in page, test should be log in, otherwise sign up
                  Container(
                    height: 60,
                    // this means use 100% of the width
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: isLoginPage ? Text('Login') : Text('Signup'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLoginPage = !isLoginPage;
                      });
                    },
                    // is loginpage changes the state
                    child: isLoginPage
                        ? Text('Not a member')
                        : Text('Already a member?'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
