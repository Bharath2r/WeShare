import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalVariable {
  static bool validatemobilenumber(String mobiletext) {
    final regexpmobilevalid = RegExp("^[0-9]{10}\$");

    if (mobiletext.contains(regexpmobilevalid)) {
      return true;
    }
    return false;
  }

  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static bool validatePincode(String pincode) {
    final regexpmobilevalid = RegExp("^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}\$");

    if (pincode.contains(regexpmobilevalid)) {
      return true;
    }
    return false;
  }

  static void showCurrentLocationDialog(BuildContext context, String urlStr, Function(String value) returnCall) async {
    var pincodeController = TextEditingController();
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(margin: EdgeInsets.fromLTRB(0, 10, 0, 30), child: Text("Location Pincode",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
            new TextField(
              controller: pincodeController..text = urlStr,
              autofocus: false,
              onChanged: (String textTyped) {},
              decoration: InputDecoration(
                labelText: 'Pincode',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(width: 1.0, color: GlobalVariable.colorFromHex("#fc8019"))),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(width: 1.0, color: Colors.grey)),
              ),
            ),
          ],
        )),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('Done'),
              onPressed: () {
                if (!pincodeController.text.isEmpty && validatePincode(pincodeController.text)) {
                  Navigator.pop(context);
                  returnCall.call(pincodeController.text);
                } else {
                  toastMessage("Please enter valid pincode or getcurrent location");
                }
                // print(urlStr);
              })
        ],
      ),
    );
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.TOP, timeInSecForIos: 1, fontSize: 16.0);
  }
}
