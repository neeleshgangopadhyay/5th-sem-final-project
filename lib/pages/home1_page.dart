import 'package:flutter/material.dart';

class BlogsPage extends StatefulWidget {
  BlogsPage({Key key}): super(key: key);

  @override
  _BlogsPageState createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {


  // var to store
  // onChanged callback
  String title;
  String text = "Nothing Entered";



  void _setText() {
    setState(() {
      text = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:


      SingleChildScrollView(
        child: Column(
        children: [
          Text(
              text
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 400.0, 10.0, 5.0),

            child: TextField(
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30.0),

                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: Colors.grey[800]),
                  hintText: "Type in your text",
                  fillColor: Colors.white70),
              onChanged: (value) => title = value,


            ),

          ),


          RaisedButton(
            onPressed: _setText,
            child: Text('Send'),
            color: Colors.blue,
            elevation: 8,
          ),
          SizedBox(
            height: 20,
          ),

          // changes in text
          // are shown here

        ],
      ),
    ),
    );
  }
}
