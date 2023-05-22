import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapchat/widgets/custom_icon.dart';
import 'package:snapchat/widgets/top_bar.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, required this.cameraController, required this.initCamera}) : super(key: key);
  final CameraController? cameraController;
  final Future<void> Function({required bool frontCamera}) initCamera;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _isFrontCamera = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        (widget.cameraController == null) ?
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(12)),
        ) : GestureDetector(
            onDoubleTap: () {
              _isFrontCamera = !_isFrontCamera;
              widget.initCamera(frontCamera: _isFrontCamera);
            },
            child: Builder(
              builder: (BuildContext builder) {
                var camera = widget.cameraController!.value;
                final fullSize = MediaQuery.of(context).size;
                final size = Size(fullSize.width, fullSize.height - (60));
                double scale;
                try{
                  scale = size.aspectRatio * camera.aspectRatio;
                } catch(_) {
                  scale = 1;
                }
                if (scale < 1) scale = 1/scale;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Transform.scale(
                    scale: scale,
                      child: Center(
                          child: CameraPreview(widget.cameraController!))),
                );
              }
            )),
        const TopBar(isCameraPage: true, text: ''),
        Positioned(
            bottom: 15,
            child: Row(
              children: [
                const CustomIcon(child: Icon(Icons.photo_library_outlined, color: Colors.white, size: 26,), isCameraPage: true),
                const SizedBox(width: 18,),
                IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.camera_circle, color: Colors.white, size: 50) ),
                const SizedBox(width: 18,),
                const CustomIcon(child: Icon(Icons.tag_faces, color: Colors.white, size: 26,), isCameraPage: true),
              ],
            )
        ),
      ],
    );
  }
}
