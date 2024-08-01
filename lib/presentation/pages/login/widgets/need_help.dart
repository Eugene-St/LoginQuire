import 'package:flutter/material.dart';

class NeedHelp extends StatelessWidget {
  const NeedHelp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 
      },
      child: Text(
        'Need help?',
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 16,
          fontWeight: FontWeight.w300,),
      ),
    );
  }
}