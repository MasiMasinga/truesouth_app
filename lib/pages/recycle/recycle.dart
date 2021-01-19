import 'package:flutter/material.dart';
import 'package:truesouth_app/pages/recycle/body.dart';

class RecycleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule PickUp'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}

