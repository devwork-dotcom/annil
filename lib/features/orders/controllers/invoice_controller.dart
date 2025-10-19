import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class InvoiceController extends GetxController {
  final GlobalKey invoiceKey = GlobalKey();


  Future<void> downloadInvoice() async {
    try {
      RenderRepaintBoundary boundary = invoiceKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/invoice_${DateTime.now().millisecondsSinceEpoch}.png');
      await file.writeAsBytes(pngBytes);


      await GallerySaver.saveImage(file.path);

      Get.snackbar(
        'Success',
        'Invoice downloaded successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to download invoice',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}