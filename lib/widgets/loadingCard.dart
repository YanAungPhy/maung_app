import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  final double height;
  final double width;

  const LoadingCard({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: height,
        width: width,
        color: Colors.grey[100],
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
