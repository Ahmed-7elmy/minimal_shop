import 'package:flutter/material.dart';

class MyButtonHome extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  const MyButtonHome({super.key, this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
