import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// 画像アップロード画面
class ImageUploadScreen extends StatelessWidget {
  const ImageUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '画像アップロード',
          style: GoogleFonts.notoSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
       
      ),
      body: Center(child: const Text("画像アップロード画面")),
    );
  }
}
