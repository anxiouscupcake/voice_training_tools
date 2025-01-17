import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:voice_training_tools/constants.dart';
import 'package:voice_training_tools/recording_model.dart';
import 'package:voice_training_tools/settings_screen.dart';
import 'package:voice_training_tools/spectrogram_screen.dart';

void main() {
  runApp(MaterialApp(
    title: appName,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const MainScreen(),
  ));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen())),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Provider(
        create: (_) => RecordingModel(),
        child: SpectrogramScreen(),
      ),
    );
  }
}
