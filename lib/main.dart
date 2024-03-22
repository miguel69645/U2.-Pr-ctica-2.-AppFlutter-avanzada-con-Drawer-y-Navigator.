// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final email = TextEditingController();
  final password = TextEditingController();

  void validacion() {
    if (email.text == 'admin' && password.text == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Principal()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Email o contraseña incorrectos"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  void limpiar() {
    email.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(93, 160, 239, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 60, right: 60, top: 30, bottom: 30),
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.blue,
                size: 60,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, top: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Username",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 50, right: 50, bottom: 30, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF6CA8F1),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.account_circle, color: Colors.white),
                      hintText: 'Enter your username',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 50, right: 50, bottom: 60, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF6CA8F1),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 50, right: 50),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    validacion();
                    limpiar();
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
