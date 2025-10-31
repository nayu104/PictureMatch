import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// プロフィール画面
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'プロフィール',
          style: GoogleFonts.notoSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
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
              // プロフィールヘッダー
              Row(
                children: [
                  /// TODO:アイコンが設定されていない場合は分岐処理で表示する
                  /// 今の実装は初期アイコン 
                  // アバター
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 24),
                  // 統計情報
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ユーザー名',
                          style: GoogleFonts.notoSans(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          // TODO: APIから受け取って表示する
                          children: [
                            _buildStatItem('作品', '12'),
                            const SizedBox(width: 24),
                            _buildStatItem('フォロワー', '234'),
                            const SizedBox(width: 24),
                            _buildStatItem('フォロー', '89'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // アクションボタン
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[400],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('編集'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                       padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('共有'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // 自己紹介
              Text(
                '自己紹介',
                style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'イラストレーターとして活動中。デジタルアートを中心に制作しています。',
                style: GoogleFonts.notoSans(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 32),
              
              // 作品セクション
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '作品',
                    style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'すべて見る',
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        color: Colors.pink[400],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // 作品グリッド
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.0,
                children: List.generate(12, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        size: 40,
                        color: Colors.grey[400],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }


/// 統計情報アイテム あとで初回描画時にこれを呼び出すようにする
  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.notoSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.notoSans(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
