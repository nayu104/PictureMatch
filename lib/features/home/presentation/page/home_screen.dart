import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/artwork_card.dart';
import 'package:pm/core/widgets/common_profile_button.dart';

/// ホーム画面
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const ProfileIconButton(),

        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // タイトルセクション
              Text(
                '最新の作品',
                style: GoogleFonts.notoSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'クリエイターたちの素晴らしい作品をチェックしましょう',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),

              // 作品グリッド
              GridView.count(
                // 親ウィジェットのサイズに合わせてサイズを調整（SingleChildScrollView内で使用する際に必要）
                shrinkWrap: true,
                // スクロールを無効化（親のSingleChildScrollViewでスクロールを制御）
                physics: const NeverScrollableScrollPhysics(),
                // 横方向（クロス軸）のカラム数を指定（2列のグリッド）
                crossAxisCount: 1,
                // 横方向（クロス軸）のアイテム間のスペース（16px）
                crossAxisSpacing: 16,
                // 縦方向（メイン軸）のアイテム間のスペース（16px）
                mainAxisSpacing: 16,
                // 子アイテムのアスペクト比（幅÷高さ）。値が小さいほど高さが大きくなる（0.68 = 幅に対して高さが約1.47倍）
                childAspectRatio: 1.5,
                // グリッドに表示する子ウィジェットのリスト
                children: const [
                  ArtworkCard(
                    imageUrl: 'https://picsum.photos/200/300',
                    likeCount: 567,
                  ),
                  ArtworkCard(
                    imageUrl: 'https://picsum.photos/200/300',
                    likeCount: 567,
                  ),
                  ArtworkCard(
                    imageUrl: 'https://picsum.photos/200/300',
                    likeCount: 567,
                  ),
                  ArtworkCard(
                    imageUrl: 'https://picsum.photos/200/300',
                    likeCount: 567,
                  ),
                  ArtworkCard(
                    imageUrl: 'https://picsum.photos/200/300',
                    likeCount: 423,
                  ),
                  ArtworkCard(
                    imageUrl: 'https://picsum.photos/200/300',
                    likeCount: 678,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
