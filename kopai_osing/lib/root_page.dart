import 'package:flutter/material.dart';
import 'package:kopai_osing/util_pref.dart';
import 'package:kopai_osing/util_routes.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onLoad();
    return Material(
      child: SafeArea(
          child: Center(
        child: Text("loading ..."),
      )),
    );
  }

  onLoad() async {
    await UtilPref.init();

    if (UtilPref.intro.value) {
      UtilRoutes.intro().go();
      return;
    }

    if (UtilPref.user.isEmpty) {
      UtilRoutes.login().go();
      return;
    }

    UtilRoutes.home().goOffAll();
  }
}
