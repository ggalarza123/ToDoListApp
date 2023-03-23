import "package:flutter/material.dart";
import 'package:todolistapp/authscreen/authform.dart';

class AuthScreen extends StatefulWidget {
  @override
  _authScreenState createState() => _authScreenState();
}

// Pretty much every state will return a widget
class _authScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // Scaffold holds pretty much the app bar and the body of a page
    return Scaffold(
      appBar: AppBar(
        title: Text('Login/Signup'),
      ),
      // body will use the authform.dart by creating an instance
      body: Authform(

      ),
    );
  }
}

// add function needed but adding for example notes
// this add function below can more quickly be written add(n1,n2) => n1+n2;
add(n1, n2) {
  return n1 + n2;
}
