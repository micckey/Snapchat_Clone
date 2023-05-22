import 'package:flutter/material.dart';
import 'package:snapchat/widgets/top_bar.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Stack(
        children: const [
          TopBar(isCameraPage: false, text: 'Stories',)
        ],
      ),
    );
  }
}
