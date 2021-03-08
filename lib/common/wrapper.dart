//returns to main  auth status and homepage or authenticate
import 'package:proctor/common/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:proctor/models/users.dart';
import 'package:proctor/student/home_page.dart';
import 'package:proctor/teacher/home_page.dart';
import 'package:provider/provider.dart';


class WrapUser extends StatefulWidget {

  @override
  _WrapUserState createState() => _WrapUserState();
}

class _WrapUserState extends State<WrapUser> {
  
  String usertype = "unknown";// add database usertype

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUsers>(context);

      if (user==null)
      { 
        print('here in wrapper auth');
        return Authenticate();
      }
      else
      {
        print('here in wrapper ');
        if(usertype == "teacher")
        {
          
          print('here in wrapper t');
          return TeacherHome();
        }
        else if(usertype == "admin"){
          print('here in wrapper a');
           return Container(
            color: Colors.orange,
            child: Text('This is admin Home Page')
           );
        }
        else{

          print('here in wrapper s');
          return StudentHome();
        }
      }
  }
}
