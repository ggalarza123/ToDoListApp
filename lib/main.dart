

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistapp/pages/tasklist/tasklist.dart';
import './pages/tasklistdetail/tasklistdetail.dart';
import 'package:todolistapp/authscreen/authscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  var isLoggedIn = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.robotoCondensedTextTheme(),
      ),
      home: StreamBuilder(
          stream: _userStream,
          builder: (context, userSnapshot) {
            if (userSnapshot.hasData) {
              return const TaskListPage(
                title: "Task List Page",
              );
            } else {
              return AuthScreen();
            }
          }),
      // initialRoute: '/login',
      routes: {
        '/tasklist': ((context) => const TaskListPage(title: "Task List Page")),
        '/tasklistdetail': ((context) =>
            const TaskListDetailPage(title: "Task List Detail Page")),
        '/login': ((context) => AuthScreen()),
      },
    );
  }
}
