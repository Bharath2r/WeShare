import 'package:flutter/material.dart';

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
            child: Text("WeShare"),),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()))
                    },
                    child: Text("Login"),
                    color: _colorFromHex("#fc8019"),
                  )),
              SizedBox(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup()))
                    },
                    child: Text("Sign up"),
                    textColor: Colors.white,
                    color: _colorFromHex("#000000"),
                  ))
            ],
          ),
        )
      ])), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
