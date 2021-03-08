import 'package:flutter/material.dart';
import 'package:proctor/service/auth.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key key}): super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}
class _ResetPasswordState extends State<ResetPassword> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService auth = AuthService();
  String email = "";
  String message = "" ;
  bool visibility = false;

  String button(){
    if(message == "Email Link Sent Succesfully!"){
      return "OK";
    }
    else{
      return "Try Again";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(

        child: ListView(

          padding: EdgeInsets.all(5.0),
          children: <Widget>[

            Visibility(
              visible: visibility,
              maintainSize: false, 
	            maintainAnimation: true,
	            maintainState: true,
              child: Container(
                height: 100,
                width: 700,
                margin: EdgeInsets.all(2.0),
                padding: EdgeInsets.all(3.0),
                child: Column(
                  children: <Widget>[
                    Text(message),
                    ElevatedButton(
                      onPressed: (){
                        if(message == "Email Link Sent Succesfully!"){
                        Navigator.pop(context);
                      }
                      else{
                        setState(() {
                          visibility = false ;
                        });
                      }
                      } , 
                      child: Text(button()) ,
                    ),
                  ]
                ),
              )
            ),

            Column (
              children: <Widget> [
                Image.asset('images/resetp.png'),
                SizedBox(height: 40.0),
                Text('Reset PASSWORD'),
              ],
            ),

            Container  (
              padding: EdgeInsets.all(10),
              child: TextField  (
                controller: emailController,
                decoration: InputDecoration (
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter your registered email',
                ),
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),
            ),

            Container (
              height: 50,
              width: 500,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: RaisedButton  (
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('Send Reset Link'),
                onPressed: () async {
                  dynamic res = await auth.emailpswd(email);
                  
                  if(res != null){
                    message = "Email Link Sent Succesfully!";
                  }
                  else{
                    message = "Something went Wrong!";
                  }
                  setState(() {
                    visibility = true ;
                  });
                  print(res);

                },
              )
            ),

            Container(
              height:  50,
              width: 500,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context) ; 
                },
                textColor: Colors.red,
                child: Text('Cancel'),
              ),
            ),

          ],
        ),

      ),
    );
  }

}
