import 'package:flutter/material.dart';

class NotFoundNavigator extends StatelessWidget {
  const NotFoundNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Card(
        child: Text("404 not found Page"),
      ),
    );
  }
}