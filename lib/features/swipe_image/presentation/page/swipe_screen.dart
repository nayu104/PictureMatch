import 'package:flutter/material.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  final List<SwipeItem> _items = [
    const SwipeItem(
      id: 'art-001',
      title: '桜の夜道',
      imageUrl: 'https://picsum.photos/id/1011/600/900',
    ),
    const SwipeItem(
      id: 'art-002',
      title: '星屑の街',
      imageUrl: 'https://picsum.photos/id/1025/600/900',
    ),
    const SwipeItem(
      id: 'art-003',
      title: '水彩の朝',
      imageUrl: 'https://picsum.photos/id/1035/600/900',
    ),
  ];

  Offset _dragOffset = Offset.zero;
  double _dragAngle = 0;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta;
      _dragAngle = _dragOffset.dx / 300;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    const double threshold = 120;

    if (_dragOffset.dx > threshold) {
      _handleDecision(isLike: true);
    } else if (_dragOffset.dx < -threshold) {
      _handleDecision(isLike: false);
    } else {
      setState(() {
        _dragOffset = Offset.zero;
        _dragAngle = 0;
      });
    }
  }

  void _handleDecision({required bool isLike}) {
    if (_items.isEmpty) return;

    final SwipeItem decided = _items.removeAt(0);
    debugPrint(isLike ? 'LIKE  : ${decided.id}' : 'SKIP  : ${decided.id}');

    setState(() {
      _dragOffset = Offset.zero;
      _dragAngle = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('出会う'),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: const Center(
          child: Text('すべてのカードを見終えました'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('出会う'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          if (_items.length > 1)
            _SwipeCard(
              item: _items[1],
              marginTop: 24,
              scale: 0.9,
            ),
          GestureDetector(
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..translate(_dragOffset.dx, _dragOffset.dy)
                ..rotateZ(_dragAngle),
              child: _SwipeCard(
                item: _items[0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SwipeCard extends StatelessWidget {
  const _SwipeCard({
    required this.item,
    this.marginTop = 0,
    this.scale = 1,
  });

  final SwipeItem item;
  final double marginTop;
  final double scale;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: size.width * 0.85 * scale,
        height: size.height * 0.65 * scale,
        margin: EdgeInsets.only(top: marginTop),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(item.imageUrl, fit: BoxFit.cover),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54],
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 32,
              child: Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 6,
                      color: Colors.black38,
                    ),
                  ],
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwipeItem {
  const SwipeItem({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  final String id;
  final String title;
  final String imageUrl;
}
