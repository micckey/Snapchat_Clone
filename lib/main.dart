import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snapchat/views/camera_screen.dart';
import 'package:snapchat/views/temporary_screen.dart';


late List<CameraDescription> _cameras;

List <CameraDescription> getCameras() {
  return _cameras;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const SnapApp());
}

class SnapApp extends StatelessWidget {
  const SnapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          splashColor: Colors.transparent, highlightColor: Colors.transparent),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const _colors = [
    Colors.yellowAccent,
    Colors.deepPurpleAccent,
    Colors.green,
    Colors.redAccent,
    Colors.blueAccent
  ];
  late int _currentScreen = 2;
  final PageController _pageController = PageController(initialPage: 2);

  late CameraController? _cameraController;

  Future<void> initCamera({required bool frontCamera}) async {
    _cameraController = CameraController(_cameras[(frontCamera) ? 1 : 0], ResolutionPreset.max);
    _cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    if(_cameras.isNotEmpty){
      initCamera(frontCamera: true);
    }
  }

  @override
  void dispose() {
    if(_cameraController != null){
      _cameraController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentScreen = index;
          });
        },
        children: <Widget>[
          TemporaryScreen(color: _colors[0]),
          TemporaryScreen(color: _colors[1]),
          CameraScreen(cameraController: _cameraController),
          TemporaryScreen(color: _colors[3]),
          TemporaryScreen(color: _colors[4]),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          selectedItemColor: _colors[_currentScreen],
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentScreen,
          onTap: (int index) {
            _pageController.jumpToPage(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.location_on_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble), label: ''),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.camera), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.play), label: ''),

          ],

          // selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
