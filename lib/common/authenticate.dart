//to authenticate register and sign in
import 'package:flutter/material.dart';
import 'package:proctor/teacher/login.dart';
import 'package:proctor/teacher/register.dart';
import 'package:proctor/student/register.dart';
import 'package:proctor/student/signin.dart';


class Authenticate extends StatefulWidget {
  
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showSignin = true ;
  String usertype = "unknown";
  void toggleForm(){
    setState(() => showSignin = !showSignin);
  }


 void redirect(userType){
  setState(() => usertype = userType);
  }


  @override
  Widget build(BuildContext context) {
    if(usertype == "unknown")
    {
      return Container(
        height: 3000,
        width: 1000,
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 100.0),
        color: Colors.blueGrey[50],
        child: ListView(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'images/admin.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                ElevatedButton(
                  onPressed: (){   
                    print('here in admin null');
                    setState(() {
                      usertype = "admin";
                    });
                  },
                  child: Text('I am an Admin')
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'images/teacher.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                ElevatedButton( 
                  onPressed: (){
                    print('here in teacher null');
                    setState(() {
                      usertype = "teacher";
                    });
                  },
                  child: Text("I am a Teacher")
                ),
              ],
            ),

            Row(
              children: [
                Image.asset(
                  'images/student.png',
                  height: 150,
                  width: 150,
                ),
                ElevatedButton(
                  onPressed: (){
                    print('here in student null');
                    setState(() {
                      usertype = "student";
                    });
                  },
                  child: Text("I am a Student")
                ),
              ],
            ),

          ],
        ),
      );
    }

    else{
    if(usertype == "admin")
    { return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Change user'),
            onPressed:(){
              return Authenticate();
            }
          ),
        ],
        title: Text('Admin'),
      ),
      body: Container(
        color: Colors.orange,
        child: Text('This is admin Login/Register Page'),
      ),
    ); 
      
    }
    else if(usertype == "teacher")
    {
      if (showSignin){
        return Container(
        child: TeacherLogin(toggleForm: toggleForm, redirect: redirect),
        );
      }
      else{
        return Container(
        child: RegisterTeacher(toggleForm: toggleForm, redirect: redirect),
        );
      }
    }
    else{
      if (showSignin){
        return Container(
        child: StudentLogin(toggleForm: toggleForm, redirect: redirect),
        );
      }
      else{
        return Container(
        child: RegisterStudent(toggleForm: toggleForm, redirect: redirect),
        );
      }
    }
  }
  }     
}