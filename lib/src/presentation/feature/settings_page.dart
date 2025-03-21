import 'package:flutter/material.dart';
import 'package:flutter_decks/src/presentation/feature/list_scroll_test.dart'
    show ListScrollTest;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings Page")),
      body: ListScrollTest(listSize: 50),
    );
  }
}
