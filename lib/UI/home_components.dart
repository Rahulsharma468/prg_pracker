import 'package:flutter/material.dart';

class HomeComonents extends StatelessWidget {
  const HomeComonents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to PG Tracker',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
