import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomAnimatedDrawerPage(),
    );
  }
}

class CustomAnimatedDrawerPage extends StatefulWidget {
  const CustomAnimatedDrawerPage({super.key});

  @override
  State<CustomAnimatedDrawerPage> createState() =>
      _CustomAnimatedDrawerPageState();
}

class _CustomAnimatedDrawerPageState extends State<CustomAnimatedDrawerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotationAnimation;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _rotationAnimation = Tween<double>(
      begin: -0.05,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isDrawerOpen = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _isDrawerOpen = false;
        });
      }
    });
  }

  void _toggleDrawer() {
    if (_controller.isAnimating) return;
    if (_isDrawerOpen) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDrawer() {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: RotationTransition(
          turns: _rotationAnimation,
          child: Material(
            color: const Color.fromARGB(255, 255, 7, 7),
            child: SafeArea(
              child: Container(
                width: 250,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Menu',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                      ),
                    ),
                    Divider(color: Color.fromARGB(179, 0, 0, 0)),
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Tracker App - Animated Drawer'),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: _toggleDrawer,
            ),
            backgroundColor: const Color.fromARGB(255, 255, 21, 17),
          ),
          body: const Center(
            child: Text(
              'Welcome to the Tracker App',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        if (_isDrawerOpen)
          GestureDetector(
            onTap: _toggleDrawer,
            child: Container(color: Colors.black54),
          ),
        _buildDrawer(),
      ],
    );
  }
}
