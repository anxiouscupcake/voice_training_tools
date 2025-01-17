import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:provider/provider.dart';
import 'package:voice_training_tools/recording_model.dart';
import 'package:fftea/fftea.dart';

class SpectrogramScreen extends StatefulWidget {
  const SpectrogramScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SpectrogramScreenState();
}

class _SpectrogramScreenState extends State<SpectrogramScreen> {
  late RecordingModel recordingModel;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    recordingModel = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: recordingModel.startRecordStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return StreamBuilder(
                  stream: snapshot.data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                        child: Text('Data length: ${snapshot.data!.length}'),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  });
            } else {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
          }),
    );
  }
}
