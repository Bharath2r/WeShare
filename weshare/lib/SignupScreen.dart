import 'package:flutter/material.dart';
import 'package:weshare/GlobalVariable.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

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
  final FocusNode _nodeText3 = FocusNode();

  var stateDropdownValue;
  var statesList = <String>[
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttarakhand',
    'Uttar Pradesh',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli',
    'Daman and Diu',
    'Delhi',
    'Lakshadweep',
    'Puducherry'
  ];
  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText3,
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp"),
          backgroundColor: GlobalVariable.colorFromHex("#fc8019"),
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
                        contentPadding: EdgeInsets.all(10.0),
                        labelText: 'Enter FirstName',
//                        errorStyle: TextStyle(),
                        errorText: firstNameValidate ? 'Please enter firstname' : null,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 1.0, color: GlobalVariable.colorFromHex("#fc8019"))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: ""),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: lastName,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        labelText: 'Enter LastName',
                        errorText: lastNameValidate ? 'Please enter lastname' : null,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 1.0, color: GlobalVariable.colorFromHex("#fc8019"))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: ""),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    focusNode: _nodeText3,
                    textInputAction: TextInputAction.next,
                    controller: contactNumber,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        labelText: 'Enter ContactNumber',
                        errorText: contactNumberValidate ? contactNumberMsg : null,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 1.0, color: GlobalVariable.colorFromHex("#fc8019"))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: ""),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: emailField,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        labelText: 'Enter Email',
                        errorText: emailValidate ? errorEmailMsg : null,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 1.0, color: GlobalVariable.colorFromHex("#fc8019"))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: ""),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(bottom: stateValidate ? 2 : 15),
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // color: Colors.cyan,
                    border: Border.all(color: Colors.grey)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    autofocus: true,
                    key: Key("state"),
                    hint: Text('Select State'),
                    value: stateDropdownValue,
                    onChanged: (newValue) {
                      setState(() {
                        stateDropdownValue = newValue;
                      });
                    },
                    items: statesList.map((stateValue) {
                      return DropdownMenuItem(
                        child: new Text(stateValue),
                        value: stateValue,
                      );
                    }).toList(),
                  ),
                ),
              ),
              Visibility(
                  visible: stateValidate,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15, left: 2),
                    child:
                        Padding(padding: EdgeInsets.only(left: 10.0), child: Text("Please select state", style: TextStyle(color: Colors.redAccent,fontSize: 12))),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: city,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        labelText: 'Enter city',
                        errorText: cityValidate ? 'Please enter city' : null,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 1.0, color: GlobalVariable.colorFromHex("#fc8019"))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: ""),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                    textInputAction: TextInputAction.done,
                    controller: pinCode,
                    onSubmitted: (_) => FocusScope.of(context).unfocus(),
                    // submit and hide keyboard
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        labelText: 'Enter PinCode',
                        errorText: pinCodeValidate ? pinCodeMsg : null,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(width: 1.0, color: GlobalVariable.colorFromHex("#fc8019"))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: ""),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )),
              SizedBox(
                  width: 200,
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
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
                              var contactValidate = GlobalVariable.validatemobilenumber(contactNumber.text);
                              if (contactValidate == true) {
                                contactNumberValidate = false;
                              } else {
                                contactNumberValidate = true;
                                contactNumberMsg = "Please enter validate ContactNumber";
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login(
                                        isComingSignUp: true,
                                      )));
                            }
                          })
                        },
                        child: Text("CONTINUE"),
                        color: GlobalVariable.colorFromHex("#fc8019"),
                      ))),
            ],
          ),
        )
        //)) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

bool validateEmail(String emailtext) {
  final regexpemailvalid =
      RegExp("^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)\$");

  if (emailtext.contains(regexpemailvalid)) {
    return true;
  }
  return false;
}
