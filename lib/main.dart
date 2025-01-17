import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:voice_training_tools/constants.dart';
import 'package:voice_training_tools/recording_model.dart';
import 'package:voice_training_tools/spectrogram_screen.dart';

void main() {
  runApp(Provider(
    create: (_) => RecordingModel(),
    child: const VoiceTrainingToolsApp(),
  ));
}

class VoiceTrainingToolsApp extends StatelessWidget {
  const VoiceTrainingToolsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appName),
        ),
        body: SpectrogramScreen(),
      ),
    );
  }
}
