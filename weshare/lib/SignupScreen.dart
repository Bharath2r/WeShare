import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SignupPage createState() => SignupPage();
}

class SignupPage extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp"),
          backgroundColor: _colorFromHex("#fc8019"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20,left: 10,right: 10),
       child: ListView(
           // child: Card(
        //  child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 15,top: 10),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                      labelText: 'Enter FirstName',
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
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter LastName',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "Enter LastName"),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter ContactNumber',
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
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter Email',
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
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter State',
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
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                        labelText: 'Enter city',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey)),
                        hintText: "Enter city"),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => FocusScope.of(context).unfocus(), // submit and hide keyboard
                    decoration: InputDecoration(
                        labelText: 'Enter PinCode',
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
                        onPressed: () => {setState(() {})},
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
