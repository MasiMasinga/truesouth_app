import 'package:flutter/material.dart';
import 'file:///C:/Users/Public/Flutter/truesouth_app/lib/pages/home/home.dart';

class LoginUpPage extends StatefulWidget {
  @override
  _LoginUpPageState createState() => _LoginUpPageState();
}

class _LoginUpPageState extends State<LoginUpPage> {
  final GlobalKey<FormState> _key = new GlobalKey();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _validate = false;
  bool visible = true;
  String email, password;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      body: new Form(key: _key, autovalidate: _validate, child: _body(context)),
    );
  }

  _body(BuildContext context) =>
      ListView(physics: BouncingScrollPhysics(), children: <Widget>[
        Container(
            padding: EdgeInsets.all(15),
            child: Column(children: <Widget>[_formUI()]))
      ]);

  @override
  void dispose() {
    if (this.mounted) super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  _formUI() {
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40.0),
          SizedBox(height: 12.0),
          _inputEmail(),
          SizedBox(height: 12.0),
          _inputPassword(),
          SizedBox(height: 12.0),
          SizedBox(height: 20.0),
          SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.lightGreen.shade700,
                textColor: Colors.white,
                padding: const EdgeInsets.all(15.0),
                child: Text("LOGIN".toUpperCase()),
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ))
        ],
      ),
    );
  }

  _inputEmail() {
    return new TextFormField(
      controller: _emailController,
      decoration: new InputDecoration(
        contentPadding: const EdgeInsets.all(16.0),
        hintText: 'Email',
        prefixIcon: _prefixIcon(Icons.email),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (str) {
        email = str;
      },
    );
  }

  _inputPassword() {
    return TextFormField(
        controller: _passwordController,
        obscureText: visible,
        validator: validatePassword,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16.0),
            hintText: 'Password',
            prefixIcon: _prefixIcon(Icons.lock),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.1),
            suffix: InkWell(
              child: visible
                  ? Icon(
                Icons.visibility_off,
                size: 18,
                color: Colors.orange,
              )
                  : Icon(
                Icons.visibility,
                size: 18,
                color: Colors.orange,
              ),
              onTap: () {
                setState(() {
                  visible = !visible;
                });
              },
            )),
        onSaved: (str) {
          password = str;
        });
  }

}

_prefixIcon(IconData iconData) {
  return Container(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(10.0))),
      child: Icon(
        iconData,
        size: 20,
        color: Colors.grey,
      ));
}


String validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.isEmpty) {
    return 'Email is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Invalid email';
  } else {
    return null;
  }
}

String validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 4) {
    return 'Password must be at least 4 characters';
  }
  return null;
}


bool validationEqual(String currentValue, String checkValue) {
  if (currentValue == checkValue) {
    return true;
  } else {
    return false;
  }
}
