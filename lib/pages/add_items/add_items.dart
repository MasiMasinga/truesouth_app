import 'package:flutter/material.dart';
import 'package:truesouth_app/pages/add_items/body.dart';

class AddItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
