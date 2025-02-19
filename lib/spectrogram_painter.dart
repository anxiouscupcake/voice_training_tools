import 'dart:math';
import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class SpectrogramPainter extends CustomPainter {
  final List<Float64List> spectrogram;

  SpectrogramPainter(this.spectrogram);

  @override
  void paint(Canvas canvas, Size size) {
    if (spectrogram.isEmpty) {
      return;
    }

    // canvas.translate(0, -100);

    Paint paint = Paint();
    paint.isAntiAlias = false;
    paint.strokeWidth = 2;
    paint.color = Color.fromARGB(255, 0, 132, 214);

    Uint8List pixels = Uint8List(spectrogram.length * spectrogram.first.length);
    for (var i = 0; i < pixels.length; i++) {
      pixels[i] = 0;
    }

    // if (kDebugMode) {
    //   print(
    //       "Spectrogram has ${spectrogram.length} chunks, ${spectrogram[0].length} bytes each");
    // }

    for (var i = 0; i < spectrogram.length; i++) {
      for (var j = 0; j < spectrogram[i].length; j++) {
        var chunk = spectrogram[i];
        paint.color = Color.fromARGB(255, 0, 0, (chunk[j] * 255.0).floor());
        var point = List<Offset>.filled(
            1, Offset(i.floorToDouble(), j.floorToDouble()));
        canvas.drawPoints(PointMode.points, point, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return spectrogram.isNotEmpty;
  }
}
