import 'dart:ui';

import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}): super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff00BCD1),
        body: InputPage(),
        appBar: AppBar(
          title: Text("TEACHER PROFILE PAGE"),
        ),



    );

  }
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body:

        Column(children: <Widget>[
          Image.asset('assets/teacher.jpg'),
          SizedBox(height: 30.0),


          Padding(
          padding: const EdgeInsets.all(8.0),




            child: Text(
            "PERSONAL BIODATA",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Table(
            // textDirection: TextDirection.rtl,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "NAME",
                  textScaleFactor: 1.5,
                ),
                Text("", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "EMAIL ID",
                  textScaleFactor: 1.5,
                ),
                Text("", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text("DEGREE", textScaleFactor: 1.5),
                Text("", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text("POST", textScaleFactor: 1.5),
                Text("", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text("CONTACT", textScaleFactor: 1.5),
                Text("", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
            ],
          ),
        ),
      ]),
    floatingActionButton: Column(

      mainAxisAlignment: MainAxisAlignment.end,


    children:<Widget> [

          Text('Edit Profile'),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
          ),
        ],
      ),
    );
  }
}
class SecondRoute extends StatelessWidget{

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final teacheremail = TextEditingController();
  final degree = TextEditingController();
  final post = TextEditingController();
  final password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("UPDATE PROFILE PAGE"),
        ),
        body:
        SingleChildScrollView(child: Center(
          child: Column(
            children: <Widget>[

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: name,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Name Here'),
                  )
              ),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: teacheremail,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Email Here'),
                  )
              ),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: phoneNumber,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Phone Number Here'),
                  )
              ),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: degree,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Degree Here'),
                  )
              ),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: post,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Post Here'),
                  )
              ),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: password,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Password Here'),
                  )
              ),

              Container(
                width: 280,
                padding: EdgeInsets.all(10.0),

              ),



              RaisedButton(
                onPressed:() {
                  Navigator.pop(context);
                },
                elevation: 30,


                color: Color(0xffFF1744),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: Text('SHOW PROFILE'),
              ),

            ],
          ),
        )
    ),
    );
  }




}
