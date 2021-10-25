import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'DashBoard.dart';
import 'constants.dart';
import 'home.dart';

class Register extends StatefulWidget {
  static const routeName = "/RegisterPage";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register() async {
    var url = "http://192.168.1.10/aplikasi_login/register.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
    } else {
      Fluttertoast.showToast(
          msg: 'Pendaftaran Berhasil',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            _iconRegistrasi(),
            _titleDescription(),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.underlineTextField,
                    width: 1.5,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
                hintText: "Username",
                hintStyle: TextStyle(color: ColorPalette.hintColor),
              ),
              controller: user,
              style: TextStyle(color: Colors.white),
              autofocus: false,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorPalette.underlineTextField,
                    width: 1.5,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: ColorPalette.hintColor),
              ),
              controller: pass,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              autofocus: false,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
            ),
            InkWell(
              onTap: () {
                register();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                width: double.infinity,
                child: Text(
                  'Registrasi',
                  style: TextStyle(color: ColorPalette.primaryColor),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
            ),
            Text(
              'or',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
            FlatButton(
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget _iconRegistrasi() {
  return Image.asset(
    "assets/images/3.jpg",
    width: 150.0,
    height: 150.0,
  );
}

Widget _titleDescription() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      Text(
        "Daftar Vald00s",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      Text(
        "Masukan Username dan Password ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
