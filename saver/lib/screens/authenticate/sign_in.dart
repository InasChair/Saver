import 'package:flutter/material.dart';
import 'package:saver/screens/authenticate/register.dart';
import 'package:saver/services/auth.dart';
import 'package:saver/shared/constants.dart';
import 'package:saver/shared/loading.dart';

/*void main(){
  runApp(new MaterialApp(
    home:SignIn(),
    routes: <String,WidgetBuilder>{
      '/Register':(BuildContext context) => new Register(),
    }),);
}*/

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading=false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    //FocusNode myFocusNode = FocusNode();
    return loading? Loading(): Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor:appBarColor,
        elevation: 0.0,
        title: Text('Sign in to Saver'),
        actions: <Widget>[
          
          FlatButton.icon(
            textColor: Colors.white,
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'Register',
            ),
            onPressed: () async{
            widget.toggleView();
  //onPressed: (){Navigator.of(context).pushNamed('/Register');};
            }
          ),
        ],
      ),
      body: Container(
        
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
        /* child: RaisedButton(
            shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.white10)
            ),
    
              child: Text('Sign In'),
              onPressed: () async{
                dynamic result=await _auth.signInAnon();
                if(result==null){
                  print('error signing in');
                }else{
                  print('signing in');
                  print(result.uid);
                }
    
              },
            ),*/
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text('E-mail',
              style: textStyle,),
              TextFormField(
                  style: textFormFildStyle,
                  decoration: textInputDecoration.copyWith(
                    prefixIcon: const Icon(Icons.person, color: Colors.red,),
                  //  labelText: 'Email',
                    hintText: 'enter your E-mail.',
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20.0),
              Text('Password',
              style: textStyle,),
              TextFormField(
                  style: textFormFildStyle,
                  decoration: textInputDecoration.copyWith(
                    prefixIcon: const Icon(Icons.lock, color: Colors.red,),
                   // labelText: 'Password',
                    hintText: 'enter your Password.',
                    
                  ),
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
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
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                    setState(()=>loading=true);
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {

                        setState(() {
                            error = 'DOULD NOT SIGN IN WITH THOSE CREDENTIALS';
                            loading=false;
                            });
                      }
                    }
                  }),
              SizedBox(
                height: 12.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red[600], fontSize: 18.0 ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
