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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              color: Colors.amberAccent,
              child: Form(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/icon/flutterando_icon.png"),
                    ),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Name",
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
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
                            borderSide: new BorderSide(color: Colors.teal)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: OutlineButton(
                        borderSide: BorderSide(
                          color: Color(0xff0f0f0f0f),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.lightGreenAccent,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
