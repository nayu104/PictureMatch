import 'package:flutter/material.dart';

/// 設定画面
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('設定画面'),
      ),
    );
  }
}
