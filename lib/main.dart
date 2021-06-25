
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Location.dart';

void main() => runApp(StartApp());

_makingPhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(
        url,
    );
  } else {
    throw 'Could not make phone $url';
  }
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Parent Care'),
          backgroundColor: Colors.green,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [

              Image(
                image: AssetImage('assets/pic1.jpg'),
                width: 200 ,
                height: 100,

              ),

                Container(
                  height: 20.0,
                ),
                RaisedButton(

                  onPressed: (){
                    _makingPhoneCall("tel: 1669");
                  },
                  child: Text('Call'),
                  textColor: Colors.black,
                  padding: const EdgeInsets.all(5.0),
                ),

                Image(
                  image: AssetImage('assets/pic2.jpg'),
                  width: 200 ,
                  height: 100,

                ),

                Container(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: (){
                    _makingPhoneCall("tel: 199");
                  },
                  child: Text('Call'),
                  textColor: Colors.black,
                  padding: const EdgeInsets.all(5.0),
                ),
                Image(
                  image: AssetImage('assets/pic3.jpg'),
                  width: 200 ,
                  height: 100,

                ),

                Container(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: (){
                    _makingPhoneCall("tel: 191");
                  },
                  child: Text('Call'),
                  textColor: Colors.black,
                  padding: const EdgeInsets.all(5.0),
                ),
                Image(
                  image: AssetImage('assets/pic4.jpg'),
                  width: 200 ,
                  height: 100,

                ),

                Container(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Location()),
                    );
                  },
                  child: Text('Send'),
                  textColor: Colors.black,
                  padding: const EdgeInsets.all(5.0),
                ),

              ],
            ),
          ),
        ),
      );

  }
}