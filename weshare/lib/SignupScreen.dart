import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class Signup extends StatefulWidget {
  Signup({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SignupPage createState() => SignupPage();
}

class SignupPage extends State<Signup> {
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController contactNumber = new TextEditingController();
  TextEditingController emailField = new TextEditingController();
  TextEditingController state = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController pinCode = new TextEditingController();
  String errorEmailMsg;
  String contactNumberMsg;
  String pinCodeMsg;
  bool firstNameValidate = false;
  bool lastNameValidate = false;
  bool contactNumberValidate = false;
  bool emailValidate = false;
  bool stateValidate = false;
  bool cityValidate = false;
  bool pinCodeValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp"),
          backgroundColor: _colorFromHex("#fc8019"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: ListView(
            // child: Card(
            //  child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 15, top: 10),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: firstName,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter FirstName',
//                        errorStyle: TextStyle(),
                        errorText:
                            firstNameValidate ? 'Please enter firstname' : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "Enter FirstName"),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: lastName,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter LastName',
                        errorText:
                            lastNameValidate ? 'Please enter lastname' : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "Enter LastName"),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    textInputAction: TextInputAction.next,
                    controller: contactNumber,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter ContactNumber',
                        errorText:
                            contactNumberValidate ? contactNumberMsg : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "Enter ContactNumber"),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: emailField,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter Email',
                        errorText: emailValidate ? errorEmailMsg : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "Enter Email"),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: state,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter State',
                        errorText: stateValidate ? 'Please enter state' : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "Enter State"),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: city,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter city',
                        errorText: cityValidate ? 'Please enter city' : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "Enter city"),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    textInputAction: TextInputAction.done,
                    controller: pinCode,
                    onSubmitted: (_) => FocusScope.of(context).unfocus(),
                    // submit and hide keyboard
                    decoration: InputDecoration(
                        labelText: 'Enter PinCode',
                        errorText: pinCodeValidate ? pinCodeMsg : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "Enter PinCode"),
                  )),
              SizedBox(
                  width: 200,
                  child: Container(
                      margin: EdgeInsets.only(top: 35),
                      child: RaisedButton(
                        onPressed: () => {
                          setState(() {
                            if (firstName.text.isEmpty) {
                              firstNameValidate = true;
                            } else {
                              firstNameValidate = false;
                            }
                            if (lastName.text.isEmpty) {
                              lastNameValidate = true;
                            } else {
                              lastNameValidate = false;
                            }
                            if (contactNumber.text.isEmpty) {
                              contactNumberValidate = true;
                              contactNumberMsg = "Please Enter ContactNumber";
                            } else {
                              var contactValidate =
                                  validatemobilenumber(contactNumber.text);
                              if (contactValidate == true) {
                                contactNumberValidate = false;
                              } else {
                                contactNumberValidate = true;
                                contactNumberMsg =
                                    "Please enter validate ContactNumber";
                              }
                            }
                            if (emailField.text.isEmpty) {
                              emailValidate = true;
                              errorEmailMsg = "Please enter email";
                            } else {
                              var validaEmail = validateEmail(emailField.text);
                              if (validaEmail == true) {
                                //validate email
                                emailValidate = false;
                              } else {
                                //not validate email
                                emailValidate = true;
                                errorEmailMsg = "Please enter validate email";
                              }
                            }
                            if (state.text.isEmpty) {
                              stateValidate = true;
                            } else {
                              stateValidate = false;
                            }
                            if (city.text.isEmpty) {
                              cityValidate = true;
                            } else {
                              cityValidate = false;
                            }
                            if (pinCode.text.isEmpty) {
                              pinCodeValidate = true;
                              pinCodeMsg = "Please enter pincode";
                            } else {
                              if (pinCode.text.length == 6) {
                                pinCodeValidate = false;
                              } else {
                                pinCodeValidate = true;
                                pinCodeMsg = "PinCode must be 6 characters";
                              }
                            }

                            if (firstNameValidate == false &&
                                lastNameValidate == false &&
                                contactNumberValidate == false &&
                                emailValidate == false &&
                                stateValidate == false &&
                                cityValidate == false &&
                                pinCodeValidate == false) {
                              print("call api");
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(isComingSignUp: true,)));
                            }
                          })
                        },
                        child: Text("CONTINUE"),
                        color: _colorFromHex("#fc8019"),
                      ))),
            ],
          ),
        )
        //)) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

bool validateEmail(String emailtext) {
  final regexpemailvalid = RegExp(
      "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)\$");

  if (emailtext.contains(regexpemailvalid)) {
    return true;
  }
  return false;
}

bool validatemobilenumber(String mobiletext) {
  final regexpmobilevalid = RegExp("^\\+(?:[0-9]●?){6,14}[0-9]\$");

  if (mobiletext.contains(regexpmobilevalid)) {
    return true;
  }
  return false;
}
