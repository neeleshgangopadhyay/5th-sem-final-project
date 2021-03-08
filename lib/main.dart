import 'package:proctor/common/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proctor/service/auth.dart';
import 'package:provider/provider.dart';
import 'models/users.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('$snapshot.error');
          return SomethingWentWrong();
        } 
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<AppUsers>.value(
            value: AuthService().user,
              child: MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: WrapUser(),
              ),
          );
        }
       // Otherwise, show something whilst waiting for initialization to complete
        return Loading(); 
      } 
    );
    
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('SomethingwentWrong',textDirection: TextDirection.ltr,),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('StillLoading',textDirection: TextDirection.ltr,),
    );
  }
}
