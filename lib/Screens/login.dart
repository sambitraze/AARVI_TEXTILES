import 'package:aarvi_textiles/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool _loggingIn = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('AARVI TEXTILES')), backgroundColor: Colors.brown,),
      body:  Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  autocorrect: true,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                  ),
                  validator: (val) => val.isEmpty ? 'Enter password' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(
                  height: 35,
                ),
                RaisedButton(
                  child: Text("Sign-In"),
                  onPressed: () async {
                    setState(() {
                      _loggingIn = true;
                    });
                    FirebaseUser user = await _auth.signIn(email, password);
                    setState(() {
                      _loggingIn = false;
                      error = 'Invalid Username and Password!';
                    });
                    if(user.uid == null){
                      user = null;
                      setState(() {
                        error = "Could not log in";
                      });
                    }
                    else{
                      print(user.uid);
                      print(user.email);
                      setState(() {
                        error = "";
                      });
                    }
                  },
                ),
                RaisedButton(
                  child: Text("Sign in (ONLY FOR DEBUG)"),
                  onPressed: () async {
                    _loggingIn = true;
                    AuthResult result = await FirebaseAuth.instance.signInAnonymously();
                    print(result.user.uid);
                    _loggingIn = false;
                    Navigator.pushNamed(context, '/AdminHomePage');
                  },
                ),

                Container(
                  child: !_loggingIn? Text(error,
                  style: TextStyle(
                    color: Colors.red
                  ),): CircularProgressIndicator(),
                )
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
