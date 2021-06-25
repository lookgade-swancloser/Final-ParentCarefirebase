import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share/share.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Position _currentPosition;
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentAddress != null) Text(
                _currentAddress
            ),
            if (_currentPosition != null) Text(
                "https://www.google.com/maps/place/${_currentPosition.latitude}+${_currentPosition.longitude}"
            ),
            FlatButton(
              child: Text("Press get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
            FlatButton(
              child: Text("Share location"),
              onPressed: () {
                share(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
  void share(context){
    final RenderBox box = context.findRenderObject();

    Share.share("https://www.google.com/maps/place/${_currentPosition.latitude}+${_currentPosition.longitude}",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);

  }


}


