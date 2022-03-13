import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class UtilPref {
  // UtilPref();
  late String key;
  static final user = {}.obs;
  static final intro = true.obs;

  UtilPref.userX({Map<String, dynamic>? value}) {
    key = "user";
    if (value != null) {
      user.value = value;
      GetStorage().write(key, value);
    }
    user.assignAll(Map.from(GetStorage().read(key)??{}));
  }


  UtilPref.introX({bool? value}){
    key = "isIntro";
    if(value != null){
      intro.value = value;
      GetStorage().write(key, value);
    }
    intro.value = GetStorage().read(key) ?? true;
  }

  bool has() => GetStorage().hasData(key);
  void del() {
     GetStorage().remove(key);
     init();
  }

  static init() async{
    UtilPref.userX();
    UtilPref.introX();
  }
}
