import 'package:flutter/material.dart';

class LearnPage extends StatefulWidget {
  final ThemeData theme;

  const LearnPage({super.key, required this.theme});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text('Learn page', style: widget.theme.textTheme.titleLarge),
        ),
      ),
    );
  }
}
