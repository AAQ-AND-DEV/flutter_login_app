import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

//data class
class _LoginData {
  String name = "";
  String password = "";
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();

  _LoginData _data = new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                "images/face.png",
                width: 90,
                height: 90,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(34),
                      gapPadding: 3.3,
                    )),
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter name.";
                  } else {
                    _data.name = value;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      gapPadding: 3.3,
                    )),
                validator: (value) {
                  if (value.isEmpty) {
                    return "please enter name and/or password";
                  } else {
                    _data.password = value;
                  }
                },
              ),
            ),
            new Container(
                child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("password accepted!")));
                          setState((){
                            _data.name = _data.name;
                            _data.password = _data.password;
                          });
                        }
                      },
                      child: Text("Submit")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.reset();

                          setState(() {
                            _data.name = "";
                            _data.password = "";
                          });
                        }
                      },
                      child: Text("clear")),
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: _data.name.isEmpty ? Text(""): Text(
                "Hello there, ${_data.name} your pw was ${_data.password}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                  color: Colors.white,
                ),
              )),
            ),
          ],
        ));
  }
}
