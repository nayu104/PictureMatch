import 'package:flutter/material.dart';
//import 'package:pm/features/swipe/presentation/widgets/swipeable_image_card.dart';


class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}
class _SwipeScreenState extends State<SwipeScreen> {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe Image'),
      ),
      body: Center(
        child: const Text('Swipeable Image Cards will be here'),
      ),
    );
  }
}