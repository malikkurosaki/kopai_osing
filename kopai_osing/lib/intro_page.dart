import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopai_osing/util_pref.dart';
import 'package:kopai_osing/util_routes.dart';

final listIntro = [
  {
    "title": "Lokasi Strategis",
    "subtitle": "mudah di jangkau masyarakat , tempat yang letaknya strategis akan lebih mudah untuk pengunjung datang",
    "image": "image",
    "color": "0xff282832"
  },
  {
    "title": "Tempat Nyaman",
    "subtitle": "kamu bisa merasakan serunya kongkow di tengah pedesaan. Menyeruput kopi sambil menikmati pemandangan hijau bisa menjadi pelepas penat dari hiruk pikuk kota dan kesibukanmu sehari-hari.",
    "image": "image",
    "color": "0xff695765"
  },
  {
    "title": "jhunting foto",
    "subtitle": "Waktu dari pagi hingga sore hari dalam keadaan cerah adalah waktu terbaik buat lo hunting foto ,aktivitas fotografi di dalam ruangan dan di luar ruangan",
    "image": "image",
    "color": "0xff601C3B"
  }
];

final icons = [
Icons.add_location_rounded,
Icons.add_circle,
Icons.photo_library_sharp,
];

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);
  final halaman = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        color: Colors.grey[100],
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Container(
                color: Colors.blueGrey[50],
                child: Column(
                  children: [
                    Flexible(
                      child: PageView(
                        onPageChanged: (value) => halaman.value = value,
                        children: [
                          for (final intro in listIntro)
                            Container(
                              color:
                                  Color(int.parse(intro['color'].toString())),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(icons[listIntro.indexWhere((element) => element == intro)],
                                          size: 100, color: Colors.white),
                                      SizedBox(
                                        height: 70,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(intro['title'].toString(), textAlign: TextAlign.center, style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),),
                                      ),
                                      Text(intro['subtitle'].toString(), textAlign: TextAlign.center, style: TextStyle(
                                        color: Colors.grey[300]
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                for (final i in listIntro)
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    width: 20,
                                    height: 4,
                                    color: i['title'] ==
                                            listIntro[halaman.value]['title']
                                        ? Colors.blue
                                        : Colors.grey,
                                  )
                              ],
                            ),
                          ),
                        ),
                        MaterialButton(
                            child: Text("NEXT"),
                            onPressed: () {
                              UtilPref.introX(value: false);
                              UtilRoutes.root().goOff();
                            })
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
