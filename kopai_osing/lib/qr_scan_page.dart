import 'package:ai_barcode/ai_barcode.dart';
import 'package:camcode/cam_code_scanner.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:jsqr/scanner.dart';
import 'package:get/get.dart';
import 'package:kopai_osing/util_val.dart';

class QrScanPage extends StatelessWidget {
  const QrScanPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Container(
            color: Colors.blueGrey[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                Flexible(
                  child: ListView(
                    children: [
                      LimitedBox(
                        maxWidth: 500,
                        maxHeight: 500,
                        child: 
                        PlatformAiBarcodeScannerWidget(
                          unsupportedDescription: "gak support",
                          platformScannerController: ScannerController(scannerResult: (String result) { 
                            UtilVal.hasil.value = result;
                            Get.back();
                           }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
