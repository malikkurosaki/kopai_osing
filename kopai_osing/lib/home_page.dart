import 'package:ai_barcode/ai_barcode.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:kopai_osing/qr_scan_page.dart';
import 'package:kopai_osing/util_routes.dart';
import 'package:kopai_osing/util_val.dart';
import 'package:get/get.dart';

final listContent = [
  {
    "title": "카드 스캔",
    "image":
        "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-34.jpg?resize=300%2C200&ssl=1"
  },
  {
    "title": "카드 스캔",
    "image":
        "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-49.jpg?resize=300%2C200&ssl=1"
  },
  {
    "title": "카드 스캔",
    "image":
        "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-28.jpg?resize=300%2C200&ssl=1"
  },
  {
    "title": "카드 스캔",
    "image":
        "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-10.jpg?resize=300%2C200&ssl=1"
  },
  {
    "title": "카드 스캔",
    "image":
        "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-9.jpg?resize=300%2C200&ssl=1"
  },
  {
    "title": "카드 스캔",
    "image":
        "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-27.jpg?resize=300%2C200&ssl=1"
  },
  {
    "title": "카드 스캔",
    "image":
        "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-11.jpg?resize=300%2C200&ssl=1"
  },
  {
    "title": "카드 스캔",
    "image":
        "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-50.jpg?resize=300%2C200&ssl=1"
  },
  {
    "title": "카드 스캔",
    "image":
        "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-7.jpg?resize=300%2C200&ssl=1"
  },
  {
    "title": "카드 스캔",
    "image":
        "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-8-e1483758951346.jpg?resize=300%2C204&ssl=1"
  }
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Scaffold(
                bottomNavigationBar: BottomAppBar(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => UtilRoutes.product().go(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.home),
                              Text("Product".toUpperCase())
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => UtilRoutes.testimoni().go(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // to testimoni
                              Icon(Icons.image),
                              Text("testimoni".toUpperCase())
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: FloatingActionButton(
                  child: Text("QR"),
                  onPressed: () => Get.dialog(
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        PlatformAiBarcodeScannerWidget(
                          unsupportedDescription: "gak support",
                          platformScannerController:
                              ScannerController(scannerResult: (String result)async {
                            UtilVal.hasil.value = result;
                            print(result);
                            Get.back();
                            0.1.delay();
                            // to scan result
                            UtilRoutes.scanResult().go();
                          }),
                        ),
                        Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 500,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                  color: Colors.white24,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    constraints: BoxConstraints(maxWidth: 200),
                                    child: Row(
                                      children: [
                                        BackButton(),
                                        Text(
                                          "Arakan QR",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white10,
                                        ),
                                        width: 200,
                                        height: 200,
                                        child: Center(),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 200,
                                        ),
                                        width: double.infinity,
                                        height: 2,
                                        color: Colors.yellow,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                backgroundColor: Colors.grey.shade100,
                body: SafeArea(
                    child: Center(
                  child: Container(
                    color: Colors.grey[50],
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Image.network(
                                "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/genjaharum-40.jpg?resize=300%2C200&ssl=1",
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.black.withOpacity(0.6),
                                  ],
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "KOPAI OSING",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      "Isun iki wes welas nyang riko",
                                      style: TextStyle(
                                          color: Colors.blueGrey[200],
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            child: ListView(
                              children: [
                                Image.network(
                                    "http://genjaharum.com/wp/wp-content/uploads/logo-genjaharum-500.png"),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text("""
HOURS & INFO
DESA KEMIREN, KEC. GLAGAH, BANYUWANGI - JAWA TIMUR
.
+62 333 413889 (Office)
+62 823 3769 0069 (Yanti Dwi Lestari)
+62 823 0100 3966 (Setiawan)
.
Jam operasional Pk. 08.00 - 16.00 WIB
Tanggal merah dan hari besar TUTUP
""")
                                      ],
                                    ),
                                  ),
                                ),
                                for (final con in listContent)
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          con["image"]!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ],
                                    ),
                                  ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Image.network(
                                            "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/logo-kopai-osing-e1588682169210.jpg?resize=300%2C143&ssl=1"),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Tersedia di"),
                                        ),
                                        Image.network(
                                            "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/Bukalapak-Terbaru-Logo-Vector.png?resize=300%2C49&ssl=1"),
                                        Image.network(
                                            "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/Tokopedia.png?resize=300%2C80&ssl=1"),
                                        Image.network(
                                            "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/Shoope-Logo.png?resize=300%2C99&ssl=1"),
                                        Image.network(
                                            "https://i0.wp.com/genjaharum.com/wp/wp-content/uploads/Lazada.png?resize=300%2C79&ssl=1")
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))),
          ),
        ),
      ),
    );
  }
}
