import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title, this.isComingSignUp}) : super(key: key);

  final String title;
  final bool isComingSignUp;

  @override
  LoginPage createState() => LoginPage(isComingSignUp: this.isComingSignUp);
}

class LoginPage extends State<Login> {
  var otpVisibility = false;
  var verifyButtonVisiblity = false;
  var loginButtonVisiblity = true;
  bool isComingSignUp;
  LoginPage({this.isComingSignUp});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          if (isComingSignUp == true) {
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          }else {
            Navigator.pop(context, true);
            print("signup $isComingSignUp");
          }
        },
          child: Scaffold(
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
        ));
  }

  Future<bool> _onWillPop() async {
    return true;
  }


}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}