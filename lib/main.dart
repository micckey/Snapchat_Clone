import 'package:flutter/material.dart';
import 'package:snapchat/views/temprorary_screen.dart';

void main() {
  runApp(const SnapApp());
}

class SnapApp extends StatelessWidget {
  const SnapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
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

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentScreen = index;
          });
        },
        children: <Widget>[
          TemporaryScreen(color: _colors[0]),
          TemporaryScreen(color: _colors[1]),
          TemporaryScreen(color: _colors[2]),
          TemporaryScreen(color: _colors[3]),
          TemporaryScreen(color: _colors[4]),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: ''),
          ],

          // selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
