import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/string_util.dart';
import 'package:flutter_learn/utils/view_util.dart';
import 'package:flutter_learn/widgets/input_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/login_btn_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  String? userName;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [..._background(), _content()]));
  }

  _background() {
    return [
      Positioned.fill(child: Image.asset("images/img1.png", fit: BoxFit.cover)),
      Positioned.fill(
        child: Container(decoration: BoxDecoration(color: Colors.black54)),
      ),
    ];
  }

  _content() {
    return Positioned.fill(
      left: 25,
      right: 25,
      child: ListView(
        children: [
          hiSpace(height: 100),
          Text('账号密码登录', style: TextStyle(fontSize: 26, color: Colors.white)),
          hiSpace(height: 40),
          InputWidget(
            '请输入账号',
            onChanged: (text) {
              userName = text;
              _checkLoginEnable();
            },
          ),
          hiSpace(height: 10),
          InputWidget(
            '请输入密码',
            obscureText: true,
            onChanged: (text) {
              password = text;
              _checkLoginEnable();
            },
          ),
          hiSpace(height: 45),
          LoginBtnWidget('登录', enable: loginEnable, onPressed: _login),
          hiSpace(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: _toRegister,
              child: Text('注册账号', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  void _checkLoginEnable() {
    bool enable;
    if (isNotEmpty(userName) && isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }

    setState(() {
      loginEnable = enable;
    });
  }

  void _login() {
    print('login');
  }

  void _toRegister() async {
    Uri uri = Uri.parse('https://www.baidu.com');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}
