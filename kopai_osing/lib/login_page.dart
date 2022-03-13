import 'package:flutter/material.dart';
import 'package:kopai_osing/util_pref.dart';
import 'package:kopai_osing/util_routes.dart';

final defaultLogin = {"email": "malik@gmail.com", "password": "123456"};

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: SafeArea(
          child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: Container(
            color: Colors.blueGrey[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network("https://user-images.githubusercontent.com/12760538/158001920-af254ba2-350f-40f5-93fd-c1de201ecb37.png",
                      width: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                ),
                Flexible(
                  child: ListView(
                    children: [
                      form(defaultLogin['email'].toString(),
                          (String value) => defaultLogin['email'] = value),
                      form(defaultLogin['password'].toString(),
                          (String value) => defaultLogin['password'] = value),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: MaterialButton(
                    padding: EdgeInsets.all(16),
                    minWidth: double.infinity,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Login"),
                    onPressed: () {
                      UtilPref.userX(value: defaultLogin);
                      UtilRoutes.root().goOffAll();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  form(String controller, void Function(String value) onChange) => Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          controller: TextEditingController(text: controller),
          onChanged: onChange,
          decoration: InputDecoration(
            hintText: "email",
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white10)),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.email),
            label: Text("Email"),
          ),
        ),
      );
}
