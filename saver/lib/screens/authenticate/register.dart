import 'package:flutter/material.dart';
import 'package:saver/services/auth.dart';
import 'package:saver/shared/constants.dart';
import 'package:saver/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
    bool loading=false;
  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();

    return loading? Loading(): Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0.0,
        title: Text('Sign up to Saver'),
        actions: <Widget>[
          FlatButton.icon(
            textColor: Colors.white,
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'Sign In',
            ),
            onPressed: () async {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
        child: Form(
          key:
              _formkey, //to track the state of our form and help to validate it
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text('E-mail',
              style:textStyle,),
              TextFormField(
                  style:textFormFildStyle,
                  decoration: textInputDecoration.copyWith(
                   // labelText: 'Email',
                    prefixIcon: const Icon(Icons.person, color: Colors.red,),
                    hintText: 'enter your E-mail.',
                    helperText: 'please enter a valid E-mail.',
                    helperStyle: TextStyle(color: Colors.red[700],fontWeight: FontWeight.bold,fontSize: 15)
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20.0),
              Text('Password',
              style:textStyle ,
              ),
              TextFormField(
                  style:textFormFildStyle,
                  decoration: textInputDecoration.copyWith(
                     prefixIcon: const Icon(Icons.lock, color: Colors.red,),
                    //labelText: 'Password',
                    hintText: 'enter your Password.',
                    helperText: 'please enter a valid Password.',helperStyle: TextStyle(color: Colors.red[700],fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  validator: (val) => (val.length < 6 && val.contains('[0-9]'))
                      ? 'Enter a password 6+ chars long should contain numbers'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                  shape: buttonShape,
                  color: buttonColor,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      setState(() {
                           loading=true;
                      });
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {error = 'please supply a valid email';
                           loading=false;} );
                      }
                    } 
                  }),
              SizedBox(
                height: 12.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red[600], fontSize: 18.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
