import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapchat/widgets/custom_icon.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.isCameraPage, required this.text}) : super(key: key);
  final bool isCameraPage;
  final String text;

  @override
  Widget build(BuildContext context) {
    Color color = isCameraPage ? Colors.white : Colors.grey;

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 40,
            left: 10,
            child: CustomIcon(isCameraPage: isCameraPage, child: Image.asset('assets/images/bitmoji.png'))
        ),
        Positioned(
            top: 40,
            left: 65,
            child: CustomIcon(isCameraPage: isCameraPage, child: Icon(Icons.search, color: color, size: 30))
        ),
        Positioned(
            top: 50,
            child: Text(text, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
        Positioned(
            top: 40,
            right: 67,
            child: CustomIcon(isCameraPage: isCameraPage, child: Icon(Icons.person_add, color: color, size: 28))
        ),
        Positioned(
            top: 40,
            right: 12,
            child: isCameraPage? Container(
              width: 47,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black38),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Icon(Icons.flip_camera_android, color: color, size: 28),
                  const SizedBox(height: 15),
                  Icon(Icons.flash_off, color: color, size: 28),
                  const SizedBox(height: 15),
                  Icon(CupertinoIcons.moon, color: color, size: 28),
                  const SizedBox(height: 15),
                  Icon(CupertinoIcons.play_rectangle, color: color, size: 28),
                  const SizedBox(height: 15),
                  Container(
                    width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                            color: color.withOpacity(0.4)
                      ),
                      child: Icon(Icons.add, color: color, size: 28)),
                  const SizedBox(height: 10),
                ],
              ),
            ) : CustomIcon(isCameraPage: isCameraPage, child: Icon(Icons.more_horiz, color: color, size: 28,))
        ),
      ],
    );
  }
}
