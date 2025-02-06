import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Align(alignment: Alignment.centerLeft,child: Container(child: Text('Users',style: TextStyle(fontSize: 48,color: Colors.purple,fontWeight: FontWeight.bold))
      ,)),
    );
  }
}