import 'package:flutter/material.dart';
import '../models/bar_icon.dart';

class AnimatedBottomBar extends StatelessWidget {
  final int currentIcon;
  final List<BarIcon> icons;
  final ValueChanged<int>? onTap;

  const AnimatedBottomBar({
    Key? key,
    required this.currentIcon,
    required this.onTap,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              icons.map((icon) {
                final isSelected = currentIcon == icon.id;
                return GestureDetector(
                  onTap: () => onTap?.call(icon.id),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.transparent,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      icon.icon,
                      size: isSelected ? 26 : 22,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
