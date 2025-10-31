import 'package:flutter/material.dart';

/// アートワークカードウィジェット
class ArtworkCard extends StatelessWidget {
  final String imageUrl; // 画像のURL
  final int likeCount; // いいね数

  const ArtworkCard({
    super.key,
    required this.imageUrl,
    required this.likeCount,
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
            child: Image.network(
                imageUrl,
                width: 300,
                height: 400,
                fit: BoxFit.cover,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}