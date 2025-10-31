import 'package:flutter/material.dart';

/// アートワークカードウィジェット
class ArtworkCard extends StatelessWidget {
  final String imageEmoji;
  final String creatorName;
  final String creatorAvatar;
  final int likeCount;
  final List<String> tags;

  const ArtworkCard({
    super.key,
    required this.imageEmoji,
    required this.creatorName,
    required this.creatorAvatar,
    required this.likeCount,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 画像部分
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                imageEmoji,
                style: const TextStyle(fontSize: 80),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // クリエイター情報
                Row(
                  children: [
                    Text(
                      creatorAvatar,
                      style: const TextStyle(fontSize: 32),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        creatorName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // いいねボタン
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$likeCount',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                const SizedBox(height: 8),
                
                // タグ
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

