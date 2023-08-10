import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final String path;
  final String imageText;

  ImageSlider({required this.path, required this.imageText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(path),
              fit: BoxFit.cover,
              colorFilter:
              ColorFilter.mode(Colors.grey.shade500, BlendMode.modulate))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            child: Text(imageText,
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey.shade200,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}