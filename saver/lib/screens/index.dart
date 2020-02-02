import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saver/models/user.dart';
import 'package:saver/screens/authenticate/authenticate.dart';
import 'package:saver/screens/authenticate/sign_in.dart';
import 'package:saver/screens/home/home.dart';
import 'package:saver/screens/wrapper.dart';
import 'package:saver/shared/constants.dart';


class index extends StatelessWidget {
  createAlertDialog(BuildContext context) {
 
    //TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black54,
            title: Text('About us',
                style: TextStyle(
                  color: Colors.red[700],
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                )),
            content: Text(
              '\t With us you can easily find local blood drives and donation centers quickly and easily',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.5,
                child: Text(
                  'Thank you',
                  style: TextStyle(color: Colors.red[700]),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.help_outline,
              color: Colors.white,
            ),
            color: appBarColor,
            onPressed: () {
              createAlertDialog(context);
            },
          ),
        ],
        backgroundColor: appBarColor,
        elevation: 0.0,
        title: Text('Welcome Saver'),
      ),
      body: Container(
      //  padding: EdgeInsets.symmetric(vertical: 200.0, horizontal: 150.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              
              
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFC62828), Color(0xFFF44336)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90),
              )
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                      alignment: Alignment.center,
                  child:Icon(Icons.favorite,          
                          size:80,
                  color: Colors.white,
                  ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                     bottom: 32,
                      right: 32,
                  ),
                  child: Text('\t Make everyday \n your world "BLOOD DONOR" day ',
                  style:TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 18,
                  )),
                  ),

                  ),
                ],
              )
            ),
            
            Image(
              image: AssetImage(
                'assets/blood7.jpg',
              ),
            ),
           
             
            RaisedButton(
              shape: buttonShape,
              color: buttonColor,
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/SignIn');
               // Wrapper();
              },
            ),
            RaisedButton(
              shape: buttonShape,
              color:buttonColor,
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/Register');
              },
            ),
           
          ],
        ),
      ),
    );
  }
}
/*
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final user= Provider.of<User>(context);
print(user);
    //return either Home or authenticate widget 
    if(user==null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}*/
