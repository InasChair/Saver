import 'package:flutter/material.dart';
 FocusNode myFocusNode=FocusNode();
var textInputDecoration= InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      
                      enabledBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.red[700] ,width:2.0)
                         ),
                         focusedBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.red,width: 2.0) ),
                      
                      labelStyle: TextStyle(color: myFocusNode.hasFocus ? Colors.red : Colors.red),
                  helperStyle: TextStyle(color: Colors.red[700],fontSize: 15),
                  hintStyle:TextStyle(color: myFocusNode.hasFocus ? Colors.red[600] : Colors.red[600],),
                  // prefixIcon: const Icon(Icons.person, color: Colors.white70,),
                  /* helperText: 'please enter your E-mail.',
                   helperStyle:TextStyle(color: myFocusNode.hasFocus ? Colors.white60 : Colors.white70,),*/
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red[700],width: 0.0)),
                  errorStyle: TextStyle(color: Colors.red[700],),
                  );
var backGroundColor=Colors.white;
var appBarColor= Colors.red[800];
var textStyle=TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red[600],
              );
var textFormFildStyle=TextStyle(
                    color: Colors.red[800],
                    fontSize: 20,
                  );
var fildIconColor=Colors.redAccent;
var buttonShape=RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red[300]));
var buttonColor=Colors.red[700];
var longBar= Container(
             
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
                  child: Text('Login',
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
                  ),

                  ),
                ],
              )
            );
            