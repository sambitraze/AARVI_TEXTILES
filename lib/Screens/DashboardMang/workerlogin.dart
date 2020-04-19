import 'package:flutter/material.dart';
import 'package:aarvi_textiles/widget/bezierContainer.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkerLogin extends StatefulWidget {
  @override
  _WorkerLoginState createState() => _WorkerLoginState();
}

class _WorkerLoginState extends State<WorkerLogin> {
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
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Operator Login',
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
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
                        SizedBox(height: 50.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/workertracking');
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
                                'Login',
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
