import 'package:ecommerce_android_app/features/account/screens/account_screen.dart';
import 'package:ecommerce_android_app/features/home/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const Center(child: Text("Home Screen")),
    const AccountScreen(),
    const CartScreen(),
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
            icon: const Icon(Icons.person),
            label: "Profile",
            index: 1,
          ),
          _buildNavBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: "Cart",
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
