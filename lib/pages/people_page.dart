import 'package:flutter/material.dart';

class PeoplesPage extends StatefulWidget {
  PeoplesPage({Key key}): super(key: key);

  @override
  _PeoplesPageState createState() => _PeoplesPageState();
}

class _PeoplesPageState extends State<PeoplesPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(title: Text("STUDENT LIST PAGE"),),
      body:

      Center(

        child: Column(

          children: [




          Container(



                 child :  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[

                     RaisedButton(
                       child: new Text("I"),
                       color:  Colors.red,
                       onPressed:() {


                       },
                     ),


                     RaisedButton(
                       child: new Text("II"),
                       color:  Colors.red,
                       onPressed: () {


                         },
                     ),


                     RaisedButton(
                       child: new Text("III"),
                       color:  Colors.red,
                       onPressed: () {


                       },
                     ),


                     RaisedButton(
                       child: new Text("IV"),
                       color:  Colors.red,
                       onPressed: () {


                       },
                     ),


                   ],

                 ),


          ),
      ],
    ),
    ),
    );


  }



}
