import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:weshare/GlobalVariable.dart';
import 'package:weshare/HomeScreen.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title, this.isComingSignUp}) : super(key: key);

  final String title;
  final bool isComingSignUp;

  @override
  LoginPage createState() => LoginPage(isComingSignUp: this.isComingSignUp);
}

class LoginPage extends State<Login> {
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();

  var verifyFieldButtonVisiblity = false;
  var loginButtonVisiblity = true;
  bool isComingSignUp;

  bool mobileValidateBool = true;
  bool otpValidateBool = true;

  String mobileErrorMsg;
  String otpErrorMsg;

  TextEditingController mobileController = new TextEditingController();
  TextEditingController otpController = new TextEditingController();

  LoginPage({this.isComingSignUp});
  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
        ),
        KeyboardActionsItem(focusNode: _nodeText2, toolbarButtons: [
              (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.close),
              ),
            );
          }
        ]),
        KeyboardActionsItem(
          focusNode: _nodeText3,
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // ignore: missing_return
        onWillPop: () {
          if (isComingSignUp == true) {
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          } else {
            Navigator.pop(context, true);
            print("signup $isComingSignUp");
          }
        },
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              title: Text("Login"),
              backgroundColor: GlobalVariable.colorFromHex("#fc8019"),
            ),
            body: KeyboardActions(
    config: _buildConfig(context),
    child: Container(
                child: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 80, 0, 130),
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
                  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(15.0,0, 15.0,5.0),
                        child: TextField(
                          enabled: loginButtonVisiblity,
                          focusNode: _nodeText3,
                          keyboardType: TextInputType.phone,
                          controller: mobileController,
                          onTap: () => {
                            setState(() {
                              mobileValidateBool = true;
                            })
                          },
                          decoration: InputDecoration(
                            labelText: 'Enter Mobile Number',
                            errorText: mobileValidateBool ? null : mobileErrorMsg,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: GlobalVariable.colorFromHex("#fc8019"))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: Colors.grey)),
                          ),
                        )),
                    Visibility(
                        visible: verifyFieldButtonVisiblity,
                        child: Container(
                            margin: EdgeInsets.fromLTRB(15.0,5.0, 15.0,0),
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                              controller: otpController,
                              textInputAction: TextInputAction.done ,
                              onTap: () => {
                                setState(() {
                                  otpValidateBool = true;
                                })
                              },
                              decoration: InputDecoration(
                                labelText: 'One Time Password',
                                errorText: otpValidateBool ? null : otpErrorMsg,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: GlobalVariable.colorFromHex("#fc8019"))),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: Colors.grey)),
                              ),
                            ))),
                    Visibility(
                        visible: loginButtonVisiblity,
                        child: SizedBox(
                            width: 200,
                            child: Container(
                                margin: EdgeInsets.only(top: 35),
                                child: RaisedButton(
                                  onPressed: () => {
                                    setState(() {
                                      if (mobileController.text.isEmpty) {
                                        mobileValidateBool = false;
                                        mobileErrorMsg = "Please enter mobile number";
                                      } else {
                                        mobileValidateBool = GlobalVariable.validatemobilenumber(mobileController.text);
                                        if (!mobileValidateBool) {
                                          mobileErrorMsg = "Please enter validate number";
                                        } else {
                                          verifyFieldButtonVisiblity = true;
                                          loginButtonVisiblity = false;
                                        }
                                      }
                                    })
                                  },
                                  child: Text("Login"),
                                  color: GlobalVariable.colorFromHex("#fc8019"),
                                )))),
                    Visibility(
                        visible: verifyFieldButtonVisiblity,
                        child: SizedBox(
                            width: 200,
                            child: Container(
                                margin: EdgeInsets.only(top: 35),
                                child: RaisedButton(
                                  onPressed: () => {
                                    setState(() {
                                      if (otpController.text.isEmpty) {
                                        otpValidateBool = false;
                                        otpErrorMsg = "Please enter OTP";
                                      } else {
                                        otpValidateBool = otpValidation(otpController.text);
                                        if (!otpValidateBool) {
                                          otpErrorMsg = "Please enter valid code";
                                        } else {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(builder: (context) => Home()),
                                            (Route<dynamic> route) => false,
                                          );
                                        }
                                      }
                                    })
                                  },
                                  child: Text("Verify OTP"),
                                  color: GlobalVariable.colorFromHex("#fc8019"),
                                ))))
                  ],
                ),
              ))
            ])) // This trailing comma makes auto-formatting nicer for build methods.
            )));
  }

  Future<bool> _onWillPop() async {
    return true;
  }
}

bool otpValidation(String mobiletext) {
  final regexpmobilevalid = RegExp("^[0-9]{6}\$");

  if (regexpmobilevalid.hasMatch(mobiletext)) {
    return true;
  }
  return false;
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
