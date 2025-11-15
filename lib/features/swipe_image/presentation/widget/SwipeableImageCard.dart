import 'package:flutter/material.dart';

class SwipeableImageCard extends StatelessWidget {
  const SwipeableImageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              'https://via.placeholder.com/150',
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Image Title'),
          ),
        ],
      ),
    );
  }
}
