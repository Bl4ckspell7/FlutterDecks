import 'package:flutter/material.dart';
import 'package:flutter_decks/src/app.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late ThemeMode _selectedMode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final appState = context.findAncestorStateOfType<FlutterDecksAppState>();
    _selectedMode = appState?.themeMode ?? ThemeMode.system;
  }

  void _onThemeChanged(ThemeMode? mode) {
    if (mode == null) return;
    final appState = context.findAncestorStateOfType<FlutterDecksAppState>();
    appState?.setThemeMode(mode);
    setState(() {
      _selectedMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButtonFormField<ThemeMode>(
          initialValue: _selectedMode,
          items: const [
            DropdownMenuItem(value: ThemeMode.system, child: Text('System')),
            DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
            DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
          ],
          onChanged: _onThemeChanged,
          decoration: const InputDecoration(
            labelText: 'Theme',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
