import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            title: const Text('Settings are gonna be here'),
            subtitle: const Text('Honestly!'),
            leading: const Icon(Icons.rowing_rounded),
          )
        ],
      ),
    );
  }
}
