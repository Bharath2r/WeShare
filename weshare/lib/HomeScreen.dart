import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weshare/GlobalVariable.dart';

import 'Profile.dart';
import 'main.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: GlobalVariable.colorFromHex("#fc8019"),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    _getCurrentLocation();
                  },
                  child: Icon(
                    Icons.my_location,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        body: SizedBox(
          child: Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: new GridView.builder(
                  itemCount: 4,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      child: InkResponse(
                          onTap: () => {print(index)},
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                FlutterLogo(),
                                Text(
                                  'data',
                                ),
                                RaisedButton(
                                    child: Text("click"),
                                    onPressed: () => {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(builder: (context) => App()),
                                            (Route<dynamic> route) => false,
                                          )
                                        })
                              ],
                            ),
                          )),
                    );
                  }),
            ),
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: GlobalVariable.colorFromHex("#fc8019"),
                ),
              ),
              CustomListTile(Icons.home, "Home", () => {}),
              CustomListTile(Icons.person, "Profile", () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()))
              }),
              CustomListTile(Icons.lock_open, "Logout",
                  () => {Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => App()), (Route<dynamic> route) => false)})
            ],
          ),
        ));
  }
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        GlobalVariable.showCurrentLocationDialog(context,  place.postalCode,(pincode) =>{
print(pincode)
        });
      });
    } catch (e) {
      print(e);
    }
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function ontap;

  CustomListTile(this.icon, this.text, this.ontap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
          child: InkWell(
            splashColor: GlobalVariable.colorFromHex("#fc8019"),
            onTap: ontap,
            child: Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Row(
                    children: [
                      Icon(icon),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
