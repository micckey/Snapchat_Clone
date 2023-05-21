import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapchat/widgets/custom_icon.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 40,
            left: 10,
            child: CustomIcon(child: Image.asset('assets/images/bitmoji.png'))
        ),
        const Positioned(
            top: 40,
            left: 65,
            child: CustomIcon(child: Icon(Icons.search, color: Colors.white, size: 30))
        ),
        const Positioned(
            top: 40,
            right: 67,
            child: CustomIcon(child: Icon(Icons.person_add, color: Colors.white, size: 28))
        ),
        Positioned(
            top: 40,
            right: 12,
            child: Container(
              width: 47,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black38),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Icon(Icons.flip_camera_android, color: Colors.white, size: 28),
                  const SizedBox(height: 15),
                  const Icon(Icons.flash_off, color: Colors.white, size: 28),
                  const SizedBox(height: 15),
                  const Icon(CupertinoIcons.moon, color: Colors.white, size: 28),
                  const SizedBox(height: 15),
                  const Icon(CupertinoIcons.play_rectangle, color: Colors.white, size: 28),
                  const SizedBox(height: 15),
                  Container(
                    width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                            color: Colors.white.withOpacity(0.4)
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 28)),
                  const SizedBox(height: 10),
                ],
              ),
            )
        ),
      ],
    );
  }
}
