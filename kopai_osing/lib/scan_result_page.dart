import 'package:flutter/material.dart';

class ScanResultPage extends StatelessWidget {
  const ScanResultPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                BackButton(),
                Text('Scan Result'),
              ],
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                Text('This is the result of the scan.'),

              ],
            )
          )
        ],
      ),
    );
  }
}