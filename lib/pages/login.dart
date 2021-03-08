import 'package:firebase_auth/firebase_auth.dart';
import 'package:proctor/pages/home_page.dart';
import 'forgetpassword.dart';
import 'package:proctor/service/auth.dart';
import 'package:proctor/pages/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:proctor/common/loading.dart';

class TeacherLogin extends StatefulWidget {

  TeacherLogin({this.toggleForm, this.redirect});
  final Function redirect ;
  final Function toggleForm ;
  @override
  _TeacherLoginState createState() => _TeacherLoginState();
}

class _TeacherLoginState extends State<TeacherLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String regerror = "";
  bool loading = false ;
  String email = "";
  String password = "";
  AuthCredential credential ;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold
      (
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed:(){
              widget.toggleForm();
            }
          ),
        ],
      ),

      body: SafeArea
        (
        child: ListView
          (
          padding: EdgeInsets.all(5.0),
          children: <Widget>
          [
            Column
              (
              children: <Widget>
              [
                Image.asset('assets/bmslogo.jpeg'),
                SizedBox(height: 40.0),
                Text('Teacher LOGIN'),
              ],
            ),

            Form(
              key: _formKey,
              child: Column(
                children: <Widget> [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter email': null ,
                        controller: nameController,
                        decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.blue[50],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          borderSide: BorderSide(color : Colors.black, width : 2.0), 
                        ),
                        labelText: 'Email',
                      ),
                      onChanged: (val) {
                        setState(() => email = val);
                      }
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: TextFormField(
                      validator: (val) => val.length < 6 ? 'Enter more than 6 characters': null ,
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.blue[50],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          borderSide: BorderSide(color : Colors.black, width : 2.0), 
                        ),
                        labelText: 'Password',
                      ),
                      onChanged: (val) {
                        setState(() => password = val);    
                      }
                    ),
                  ),

                  SizedBox(
                    height:10.0,
                    child: Text( 
                      '$regerror',
                        style:TextStyle(color: Colors.red, fontSize: 30),
                      ),
                  ),

                  Container (
                    height: 50,
                    width: 500,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child :RaisedButton(
                        textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Email Login'),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          setState(() =>  loading = true);
                          print('email $email password $password');
                          dynamic result = await _auth.signinEmailpassword(email, password);
                          if (result == null){
                            setState(() {
                              loading = false ;
                              regerror =  'Something Went Wrong' ;
                            } );
                          }   
                        }
                      },
                    ),
                  ),

                  Container (
                    height: 50,
                    width: 500,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child :RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text(' Continue without logging in.'),
                      onPressed: () async {
                        dynamic result = await _auth.signInAnonymous();
                        if(result==null){
                          print('error signing in');
                        }
                        else{
                          print('signed in $result');
                          print(result.displayName);
                        } 
                      },
                    ),
                  ),

                ButtonBar(
                    children: <Widget>[
                      
                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: RaisedButton(
                          onPressed: () async {
                            //forgot password screen
                            Navigator.push(context, new MaterialPageRoute(
                              builder: (context) => ForgetPassword()),
                              );//push context
                          },
                          color: Colors.blue[900],
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,
                              ),
                            ),
                        ),
                      ),

                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue[900],
                          child: Text(' Google Login'),
                          onPressed: () async {
                            dynamic result = await _auth.signInGoogle();
                            if(result==null){
                            print('error signing in');
                            }
                            else{
                            print('signed in $result');
                            print(result.uid);
                            Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => HomePage()),
                            );//push context
                            } 
                          },
                        ),
                      ),

                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: FlatButton( 
                          onPressed: () {
                            widget.redirect('student');
                          },
                          textColor: Colors.white,
                          color: Colors.blue[900],
                          child: Text('Are you a Student ?'),
                        ),
                      ),

                    ],
                  )  

                ]
              ),

            ),
          ],

        ),
      ),
    );
  }
}  