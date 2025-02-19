import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:voice_training_tools/recording_model.dart';
import 'package:fftea/fftea.dart';
import 'package:voice_training_tools/spectrogram_painter.dart';

class SpectrogramScreen extends StatefulWidget {
  const SpectrogramScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SpectrogramScreenState();
}

class _SpectrogramScreenState extends State<SpectrogramScreen> {
  static const chunkSize = 1024;
  final stft = STFT(chunkSize, Window.hanning(chunkSize));

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
                      List<double> audio =
                          List.from(snapshot.data!.map((i) => i / 255));

                      final spectrogram = <Float64List>[];
                      stft.run(audio, (Float64x2List freq) {
                        spectrogram.add(freq.magnitudes());
                      });

                      return CustomPaint(
                        size: Size(16, 1024),
                        isComplex: true,
                        foregroundPainter: SpectrogramPainter(spectrogram),
                      );
                    } else {
                      return Center(
                        child: const Text('Waiting for input...'),
                      );
                    }
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
