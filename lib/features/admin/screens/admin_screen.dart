import 'package:ecommerce_android_app/features/admin/screens/post_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = 'home';

  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 2;
  final List<Widget> _screens = [
    const PostScreen(),
    const Center(
      child: Text("Analytics Page"),
    ),
    const Center(
      child: Text("Cart Page"),
    ),
  ];

  late AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    _iconAnimationController.forward(from: 0.0); // Reset animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildNavBarItem(
            icon: AnimatedIcon(
              icon: AnimatedIcons.home_menu,
              progress: _iconAnimationController,
            ),
            label: "Home",
            index: 0,
          ),
          _buildNavBarItem(
            icon: const Icon(Icons.analytics_outlined),
            label: "Analytics",
            index: 1,
          ),
          _buildNavBarItem(
            icon: const Icon(Icons.all_inbox_outlined),
            label: "Inbox",
            index: 2,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem({
    required Widget icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: MouseRegion(
        onEnter: (_) {
          _iconAnimationController.forward();
        },
        onExit: (_) {
          _iconAnimationController.reverse();
        },
        child: icon,
      ),
      label: label,
    );
  }
}
