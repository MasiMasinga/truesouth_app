import 'package:flutter/material.dart';
import 'package:truesouth_app/pages/profile/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
