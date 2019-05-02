import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Image.asset("assets/background.jpg"),
          ),
          Center(
            child: SingleChildScrollView(
              child: Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xFFCCFFC400),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Form(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                  "assets/icon/flutterando_icon.png"),
                            ),
                            TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Name",
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.black)),
                              ),
                              onSaved: (val) => val,
                              validator: (val) {
                                return val.length < 10 ? "Name" : null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              onSaved: (val) => val,
                              validator: (val) {
                                return val.length < 10 ? "Email" : null;
                              },
                              decoration: new InputDecoration(
                                labelText: "Email",
                                border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: OutlineButton(
                                borderSide: BorderSide(
                                  color: Color(0xff4B088A),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(
                                    color: Color(0xff4B088A),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
