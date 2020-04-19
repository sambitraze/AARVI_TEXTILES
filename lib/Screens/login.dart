import 'package:aarvi_textiles/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aarvi_textiles/widget/bezierContainer.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SingleChildScrollView(
        padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -MediaQuery.of(context).size.height * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: BezierContainer()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: SizedBox(),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'A',
                              style: GoogleFonts.portLligatSans(
                                textStyle: Theme.of(context).textTheme.display1,
                                fontSize: 50,
                                fontWeight: FontWeight.w700,
                                color: Colors.cyan,
                              ),
                              children: [
                                TextSpan(
                                  text: 'AR',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 50),
                                ),
                                TextSpan(
                                  text: 'VI',
                                  style: TextStyle(
                                      color: Colors.greenAccent, fontSize: 50),
                                ),
                                TextSpan(
                                  text: '\nTextiles',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 50),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autocorrect: true,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter password' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () async{
                            // Navigator.pushNamed(context, '/AdminHomePage');
                            setState(() {
                              _loggingIn = true;
                            });
                            FirebaseUser user =
                                await _auth.signIn(email, password);
                            setState(() {
                              _loggingIn = false;
                              error = 'Invalid Username and Password!';
                            });
                            if (user.uid == null) {
                              user = null;
                              setState(() {
                                error = "Could not log in";
                              });
                            } else {
                              print(user.uid);
                              print(user.email);
                              setState(() {
                                error = "";
                                Navigator.pushNamed(context, '/AdminHomePage');
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent,
                                  Colors.greenAccent,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(5, 5),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/WorkerLogin');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent,
                                  Colors.greenAccent,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(5, 5),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Worker Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: !_loggingIn
                              ? Text(
                                  error,
                                  style: TextStyle(color: Colors.red),
                                )
                              : CircularProgressIndicator(),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
