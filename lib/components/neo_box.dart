import 'package:flutter/material.dart';

class NeoBox extends StatelessWidget {
  const NeoBox({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 15,
                offset: const Offset(4, 4)),
            const BoxShadow(
                color: Colors.white, blurRadius: 15, offset: Offset(-4, -4))
          ]),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
