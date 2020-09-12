import 'package:flutter/material.dart';
import 'package:weshare/GlobalVariable.dart';

import 'LoginScreen.dart';
import 'SignupScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeShare',
      theme: ThemeData(
          primaryColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.black),
            hintStyle: TextStyle(color: Colors.grey),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 100, 0, 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("We",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: GlobalVariable.colorFromHex("#000000"),
                  )),
              Text("Share",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: GlobalVariable.colorFromHex("#fc8019"),
                  ))
            ],
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  height: 40,
                  width: 250,
                  child: RaisedButton(
                    onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()))},
                    child: Text("Login"),
                    color: GlobalVariable.colorFromHex("#fc8019"),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10.0),
                  height: 40,
                  width: 250,
                  child: RaisedButton(
                    onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup()))},
                    child: Text("Sign up"),
                    textColor: Colors.white,
                    color: GlobalVariable.colorFromHex("#000000"),
                  ))
            ],
          ),
        )
      ])), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
