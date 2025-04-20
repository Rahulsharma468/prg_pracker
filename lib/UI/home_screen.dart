import 'package:flutter/material.dart';
import 'package:pg_tracker/UI/home_components.dart';
import './bottom_bar.dart';
import '../models/bar_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIcon = 0;

  final List<BarIcon> icons = [
    BarIcon(id: 0, icon: Icons.home),
    BarIcon(id: 1, icon: Icons.history),
    BarIcon(id: 2, icon: Icons.home),
    BarIcon(id: 3, icon: Icons.settings),
  ];

  void onTap(int index) {
    setState(() {
      currentIcon = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        title: const Text('Home' , style: TextStyle(color: Colors.white)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        elevation: 14,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.white),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(child: HomeComonents()),
      bottomNavigationBar: AnimatedBottomBar(
        currentIcon: currentIcon,
        onTap: onTap,
        icons: icons,
      ),
    );
  }
}
