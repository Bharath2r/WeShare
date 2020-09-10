import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<Login> {
  var otpVisibility = false;
  var verifyButtonVisiblity = false;
  var loginButtonVisiblity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: _colorFromHex("#fc8019"),
        ),
        body: Center(
            child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Enter Mobile Number',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "Enter Mobile Number"),
                  )),
              Visibility(
                  visible: otpVisibility,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "One Time Password"),
                  )),
              Visibility(
                  visible: loginButtonVisiblity,
                  child: SizedBox(
                      width: 200,
                      child: Container(
                          margin: EdgeInsets.only(top: 35),
                          child: RaisedButton(
                            onPressed: () => {
                              setState(() {
                                otpVisibility = true;
                                loginButtonVisiblity = false;
                                verifyButtonVisiblity = true;
                              })
                            },
                            child: Text("Login"),
                            color: _colorFromHex("#fc8019"),
                          )))),
              Visibility(
                  visible: verifyButtonVisiblity,
                  child: SizedBox(
                      width: 200,
                      child: Container(
                          margin: EdgeInsets.only(top: 35),
                          child: RaisedButton(
                            onPressed: () => {setState(() {})},
                            child: Text("Verify OTP"),
                            color: _colorFromHex("#fc8019"),
                          ))))
            ],
          ),
        )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
