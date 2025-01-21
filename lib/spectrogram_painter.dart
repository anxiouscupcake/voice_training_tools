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

    Paint paint = Paint();
    paint.isAntiAlias = false;
    paint.strokeWidth = 1;
    paint.color = Color.fromARGB(255, 0, 132, 214);

    Uint8List pixels = Uint8List(spectrogram.length * spectrogram.first.length);
    for (var i = 0; i < pixels.length; i++) {
      pixels[i] = 0;
    }

    // for (var chunk in spectrogram) {
    //   // canvas.drawRawPoints(
    //   //     PointMode.points, Float32List.sublistView(chunk), paint);

    //   for (var pixel in chunk) {
    //     pixelsList.add(pixel as Uint8);
    //   }
    // }

    late Image img;
    Random r = Random();
    pixels =
        Uint8List.fromList(List<int>.generate(10000, (i) => r.nextInt(255)));
    decodeImageFromPixels(
      pixels,
      100,
      100,
      PixelFormat.rgba8888,
      (result) => img = result,
      allowUpscaling: true,
    );
    canvas.drawImage(img, Offset.zero, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return spectrogram.isNotEmpty;
  }
}
