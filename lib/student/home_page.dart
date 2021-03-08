import 'package:proctor/models/students.dart';
import 'package:proctor/service/auth.dart';
import 'package:provider/provider.dart';
import 'package:proctor/service/database.dart';
import 'account_page.dart';
import 'blogs_page.dart';
import 'course_page.dart';
import 'package:flutter/material.dart';

class StudentHome extends StatefulWidget {
  StudentHome({Key key}): super(key: key);

  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    BlogsPage(), CoursePage(), AccountPage(),
  ];
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onItemTapped(int selectedIndex){
    _pageController.jumpToPage(selectedIndex);
  }
  final AuthService _auth = AuthService();
  final dbuser = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Student>>.value(
      value: FirestoreService().users,//add uid ifps
      child: Scaffold(
           backgroundColor: Colors.white,
          appBar: AppBar(
            title : Text('Proctor: {$_auth.currentuser()} '),
            backgroundColor: Colors.blue,
            elevation : 0.0 ,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.exit_to_app_rounded),
                onPressed: () async {
                  await _auth.signout();
                  
                }, 
                label :Text('logout'),
              ),
              
            ],
          ),
          body: PageView(
              controller: _pageController,
              children: _screens,
              onPageChanged: _onPageChanged,
              //physics: NeverScrollableScrollPhysics(),
            ),
            

          bottomNavigationBar: BottomNavigationBar(
              onTap: _onItemTapped,
              items:[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,
                    color: _selectedIndex ==0 ? Colors.blue: Colors.grey,
                  ),
                  label:'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book,
                    color: _selectedIndex ==1 ? Colors.blue: Colors.grey,
                  ),
                  label:'Courses',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person,
                    color: _selectedIndex ==2 ? Colors.blue: Colors.grey,
                  ),
                  label: 'Account',
                ),
              ] ),
      ),
    );

  }
}