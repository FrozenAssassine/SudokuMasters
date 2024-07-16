import 'package:flutter/material.dart';

class DifficultyItem extends StatelessWidget {
  final String headline;
  final String description;
  final String subheadline;
  final VoidCallback onPressed;

  const DifficultyItem({
    Key? key,
    required this.headline,
    required this.subheadline,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  8.0), // Change this value to set the border radius
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headline,
              style: const TextStyle(fontSize: 28, color: Colors.black),
            ),
            Text(
              subheadline,
              style: const TextStyle(fontSize: 24, color: Colors.black54),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
