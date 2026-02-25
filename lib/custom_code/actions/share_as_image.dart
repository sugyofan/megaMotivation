// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

Future shareAsImage(String quoteText) async {
  const double w = 1080;
  const double h = 1920;

  try {
    // ── LOAD BACKGROUND IMAGE ──
    const String bgUrl =
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mega-motivation-ydk0kj/assets/kmae7612caay/MM_Blue_Cosmic_Background.png'; // Replace with your uploaded blue cosmic background URL
    final bgBytes = (await http.get(Uri.parse(bgUrl))).bodyBytes;
    final bgCodec = await ui.instantiateImageCodec(bgBytes);
    final bgFrame = await bgCodec.getNextFrame();
    final ui.Image bgImage = bgFrame.image;

    // ── LOAD LOGO IMAGE ──
    const String logoUrl =
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/mega-motivation-ydk0kj/assets/32wd035yy3l4/logo-1.png'; // Replace with your uploaded flame logo URL
    final logoBytes = (await http.get(Uri.parse(logoUrl))).bodyBytes;
    final logoCodec = await ui.instantiateImageCodec(
      logoBytes,
      targetWidth: 400,
    );
    final logoFrame = await logoCodec.getNextFrame();
    final ui.Image logoImage = logoFrame.image;

    // ── CREATE CANVAS ──
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, w, h));

    // ── DRAW BACKGROUND ──
    canvas.drawImageRect(
      bgImage,
      Rect.fromLTWH(0, 0, bgImage.width.toDouble(), bgImage.height.toDouble()),
      Rect.fromLTWH(0, 0, w, h),
      Paint()..filterQuality = FilterQuality.high,
    );

    // ── DRAW QUOTE TEXT (auto-resize) ──
    double fontSize = 80;
    const double maxTextWidth = 920;
    const double maxTextHeight = 800;
    late ui.Paragraph paragraph;

    while (fontSize > 28) {
      final style = ui.TextStyle(
        color: const Color(0xFFFFFFFF),
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        shadows: [
          const Shadow(
            offset: Offset(3, 3),
            blurRadius: 12,
            color: Color(0x99000000),
          ),
        ],
      );

      final builder = ui.ParagraphBuilder(
        ui.ParagraphStyle(
          textAlign: TextAlign.center,
          maxLines: 20,
          height: 1.35,
        ),
      )
        ..pushStyle(style)
        ..addText(quoteText);

      paragraph = builder.build();
      paragraph.layout(const ui.ParagraphConstraints(width: maxTextWidth));

      if (paragraph.height <= maxTextHeight) break;
      fontSize -= 4;
    }

    final double quoteAreaTop = 350;
    final double quoteAreaBottom = h - 550;
    final double quoteAreaHeight = quoteAreaBottom - quoteAreaTop;
    final double textY =
        quoteAreaTop + (quoteAreaHeight - paragraph.height) / 2;

    canvas.drawParagraph(paragraph, Offset((w - maxTextWidth) / 2, textY));

    // ── DRAW LOGO (centered) ──
    final double logoX = (w - logoImage.width.toDouble()) / 2;
    final double logoY = h - 620;
    canvas.drawImage(logoImage, Offset(logoX, logoY), Paint());

    // ── DRAW "MegaMotivation" ──
    final nameBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textAlign: TextAlign.center),
    )
      ..pushStyle(ui.TextStyle(
        color: const Color(0xFFFFFFFF),
        fontSize: 52,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ))
      ..addText('MegaMotivation');
    final namePara = nameBuilder.build();
    namePara.layout(ui.ParagraphConstraints(width: w));
    canvas.drawParagraph(namePara, Offset(0, logoY + logoImage.height + 20));

    // ── DRAW TAGLINE ──
    final tagBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textAlign: TextAlign.center),
    )
      ..pushStyle(ui.TextStyle(
        color: const Color(0xCCFFFFFF),
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ))
      ..addText('Ignite Greatness Within');
    final tagPara = tagBuilder.build();
    tagPara.layout(ui.ParagraphConstraints(width: w));
    canvas.drawParagraph(tagPara, Offset(0, logoY + logoImage.height + 90));

    // ── DRAW DIVIDER LINE ──
    final dividerPaint = Paint()
      ..color = const Color(0x55FFFFFF)
      ..strokeWidth = 1;
    final double dividerY = logoY + logoImage.height + 140;
    canvas.drawLine(
      Offset((w - 300) / 2, dividerY),
      Offset((w + 300) / 2, dividerY),
      dividerPaint,
    );

    // ── DRAW COPYRIGHT ──
    final copyBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textAlign: TextAlign.center),
    )
      ..pushStyle(ui.TextStyle(
        color: const Color(0x88FFFFFF),
        fontSize: 22,
      ))
      ..addText('© 2026 MegaMotivation. All Rights Reserved.');
    final copyPara = copyBuilder.build();
    copyPara.layout(ui.ParagraphConstraints(width: w));
    canvas.drawParagraph(copyPara, Offset(0, dividerY + 25));

    // ── GENERATE IMAGE ──
    final picture = recorder.endRecording();
    final ui.Image finalImage = await picture.toImage(w.toInt(), h.toInt());
    final ByteData? byteData =
        await finalImage.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) {
      print('MegaMotivation: Failed to generate image');
      return;
    }

    final Uint8List pngBytes = byteData.buffer.asUint8List();

    // ── SHARE ──
    final xFile = XFile.fromData(
      pngBytes,
      mimeType: 'image/png',
      name: 'MegaMotivation_Quote.png',
    );
    await Share.shareXFiles([xFile], subject: 'MegaMotivation');

    print('MegaMotivation: Shared successfully');
  } catch (e) {
    print('MegaMotivation: Error sharing: $e');
  }
}
