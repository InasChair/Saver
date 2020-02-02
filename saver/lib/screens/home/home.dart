import 'package:flutter/material.dart';
import 'package:saver/services/auth.dart';
import 'dart:math';
import 'package:saver/shared/constants.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final AuthService _auth = AuthService();
  static Random random = Random();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
         backgroundColor: backGroundColor,
      key: _scaffoldKey,
      drawer: new Drawer(),
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.list),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
            backgroundColor:appBarColor,
        elevation: 0.0,
        title: Text(
          'Welcome Saver',
        ),
        
        actions: <Widget>[
         
          /* IconButton(
            icon: Icon(
              Icons.list,
             
            ),
            onPressed: (){},
          ),*/
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,

            ),
            label: Text(
              
              'logout',
              style: TextStyle(color: Colors.white,),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
         
        ],
      
      ),
       body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              SizedBox(height: 40),
              CircleAvatar(
                backgroundColor: Colors.red[800],
                radius: 80,
              ),
              SizedBox(height: 10),
              Text(
                'Inas CHAIR',
                style: TextStyle(
                  color: Colors.red[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 3),

              Text(
                "\t Share life Give blood ",
                style: TextStyle(
                  
                  color: Colors.red,
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
              ),
              
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                    color: Colors.red[700],
                    onPressed: (){},
                  ),
                  SizedBox(width: 10),
                  FlatButton(
                    child: Icon(
                      Icons.local_drink,
                      color: Colors.white,
                    ),
                    color: Colors.red[700],
                    onPressed: (){},
                  ),
                   SizedBox(width: 10),
                  FlatButton(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    color: Colors.red[700],
                    onPressed: (){},
                  ),


                ],
              ),

              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Posts",
                          style: TextStyle(color: Colors.white,

                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Friends",
                          style: TextStyle(color: Colors.white,

                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Text(
                          random.nextInt(10000).toString(),
                          style: TextStyle(
                              color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Groups",
                          style: TextStyle(color: Colors.white,

                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                padding: EdgeInsets.all(5),
                itemCount: 15,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 200 / 200,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/cm${random.nextInt(10)}.jpeg",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}