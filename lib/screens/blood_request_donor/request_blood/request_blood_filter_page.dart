import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
   FilterPage({super.key, required this.bloodRequestId});

 final String bloodRequestId;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(bloodRequestId),),
    );
  }
}
