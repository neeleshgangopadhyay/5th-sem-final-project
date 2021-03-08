//to authenticate register and sign in
import 'package:flutter/material.dart';
import 'package:proctor/student/register.dart';
import 'package:proctor/student/signin.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showSignin = true ;
  void toggleForm(){
    setState(() => showSignin = !showSignin);
  }

  
  @override
  Widget build(BuildContext context) {
    //if () { student
    if (showSignin){
      return Container(
      child: StudentLogin(toggleForm: toggleForm),
    );
    }
    else{
      return Container(
      child: RegisterStudent(toggleForm: toggleForm),
    );
    }
  // }
    //else{

    //} (teacher) 
  }
}