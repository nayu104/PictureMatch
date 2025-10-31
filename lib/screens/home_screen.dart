import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/artwork_card.dart';

/// ホーム画面
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Text('🎨', style: TextStyle(fontSize: 28)),
            const SizedBox(width: 8),
            Text(
              'イラストマッチング',
              style: GoogleFonts.notoSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
                children: const [
                  ArtworkCard(
                    imageEmoji: '🎨',
                    creatorName: '山田太郎',
                    creatorAvatar: '👨🏻‍🎨',
                    likeCount: 245,
                    tags: ['デジタル', 'ファンタジー'],
                  ),
                  ArtworkCard(
                    imageEmoji: '🎬',
                    creatorName: '佐藤花子',
                    creatorAvatar: '👩🏽',
                    likeCount: 189,
                    tags: ['アニメ', 'キャラクター'],
                  ),
                  ArtworkCard(
                    imageEmoji: '🖼️',
                    creatorName: '田中一郎',
                    creatorAvatar: '👨🏻',
                    likeCount: 312,
                    tags: ['ナチュラル', 'ハーモニー'],
                  ),
                  ArtworkCard(
                    imageEmoji: '🌸',
                    creatorName: '山田太郎',
                    creatorAvatar: '👨🏻‍🎨',
                    likeCount: 567,
                    tags: ['デザイン', 'ナチュラル'],
                  ),
                  ArtworkCard(
                    imageEmoji: '🎭',
                    creatorName: '佐藤花子',
                    creatorAvatar: '👩🏽',
                    likeCount: 423,
                    tags: ['アニメ', 'ドラマ'],
                  ),
                  ArtworkCard(
                    imageEmoji: '🌈',
                    creatorName: '田中一郎',
                    creatorAvatar: '👨🏻',
                    likeCount: 678,
                    tags: ['デジタル', 'デザイン'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pink[400],
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink[400],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.upload, color: Colors.white),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'プロフィール',
          ),
        ],
      ),
    );
  }
}

