import 'dart:typed_data';

import 'package:record/record.dart';

class RecordingModel {
  final record = AudioRecorder();
  late Future<Stream<Uint8List>> stream;

  Future<Stream<Uint8List>?> startRecordStream() async {
    if (await record.hasPermission()) {
      return record.startStream(RecordConfig(encoder: AudioEncoder.pcm16bits));
    }
    return null;
  }
}
