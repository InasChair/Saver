import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saver/models/user.dart';
import 'package:saver/screens/authenticate/register.dart';
import 'package:saver/screens/authenticate/sign_in.dart';
import 'package:saver/screens/index.dart';
import 'package:saver/screens/wrapper.dart';
import 'package:saver/services/auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(//this stream is activaly listening for authentication event 
      value: AuthService().user,
      child: MaterialApp(
  //home: Wrapper(),
  home:new index(),
       
      routes:<String,WidgetBuilder>{
          '/SignIn':(BuildContext context)=>SignIn(),
          '/Register':(BuildContext context)=>Register(),
        //'/Wrapper':(BuildContext context)=>Wrapper(),
        }
         
         ), 
    
    );
  }
}
