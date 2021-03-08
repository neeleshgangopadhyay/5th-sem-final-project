import 'account_page.dart';
import 'home1_page.dart' ;
import 'people_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    BlogsPage(), PeoplesPage(), AccountPage()
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
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
              icon: Icon(Icons.people,
                color: _selectedIndex ==1 ? Colors.blue: Colors.grey,
              ),
              label: 'People',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,
                color: _selectedIndex ==2 ? Colors.blue: Colors.grey,
              ),
              label: 'Account',
            ),
          ] ),
    );

  }
}
