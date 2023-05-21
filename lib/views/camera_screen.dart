import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapchat/widgets/custom_icon.dart';
import 'package:snapchat/widgets/top_bar.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, required this.cameraController}) : super(key: key);
  final CameraController? cameraController;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        (widget.cameraController == null) ?
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(12)),
        ) : CameraPreview(widget.cameraController!),
        const TopBar(),
        Positioned(
            bottom: 15,
            child: Row(
              children: [
                const CustomIcon(child: Icon(Icons.photo_library_outlined, color: Colors.white, size: 26,)),
                const SizedBox(width: 18,),
                IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.camera_circle, color: Colors.white, size: 50) ),
                const SizedBox(width: 18,),
                const CustomIcon(child: Icon(Icons.tag_faces, color: Colors.white, size: 26,)),
              ],
            )
        ),
      ],
    );
  }
}
