import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact;
  String _name = "";
  String mobile = "";

  @override
  Widget build(BuildContext context) {
    String test;
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blue,
        title: new Text("Contact Picker"),
      ),
      body: new Padding(
        padding: EdgeInsets.only(left: 1.0, top: 15.0, right: 1.0, bottom: 1.0),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, top: 8.0, right: 10.0, bottom: 1.0),
              child: new Row(
                children: <Widget>[
                  new Flexible(
                    flex: 17,
                    child: new Container(
                      child: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            hintStyle: new TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                            hintText: "Pick Contact",
                            fillColor: Color(0xFFEDEDED)),
                      ),
                    ),
                  ),
                  new Flexible(
                      flex: 3,
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () async {
                              Contact contact =
                                  await _contactPicker.selectContact();
                              setState(() {
                                _contact = contact;
                                _name = _contact.fullName;
                                mobile = _contact.phoneNumber.toString();
                              });
                            },
                            child: new Image.asset(
                              'assets/images/phone_book.png',
                              width: 40.0,
                              height: 40.0,
                            ),
                          )))
                ],
              ),
            ),
            _contact == null
                ? new Container()
                : Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.supervised_user_circle),
                          title: Text(_name),
                          subtitle: Text(mobile),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );

    // TODO: implement build
  }
}
/*
new Column(
mainAxisSize: MainAxisSize.min,
children: <Widget>[
Padding(
padding: EdgeInsets.only(left: 10.0,top: 8.0,right: 10.0,bottom: 1.0),
child: new Row(
children: <Widget>[

new Container(
width: 340.0,
child: new TextField(
decoration: new InputDecoration(
border: InputBorder.none,
filled: true,
hintStyle: new TextStyle(
color: Colors.grey[600],
fontWeight: FontWeight.bold),
hintText: "Pick Contact",
fillColor: Color(0xFFEDEDED)),
),
),
Padding(
padding: EdgeInsets.all(8.0),
child: GestureDetector(
onTap: () async {
Contact contact =
await _contactPicker.selectContact();
setState(() {
_contact = contact;
_name = _contact.fullName;
mobile = _contact.phoneNumber.toString();
});
},
child: new Image.asset(
'assets/images/phone_book.png',
width: 40.0,
height: 40.0,
),
))
],
),
),
_contact == null ? new Container() : Card(
child: Column(
mainAxisSize: MainAxisSize.min,
children: <Widget>[
ListTile(
leading: Icon(Icons.supervised_user_circle),
title: Text(_name),
subtitle: Text(mobile),
),
],
),
),


],
)*/
