import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String name;
  final dynamic image;
  final VoidCallback onTap;
  CategoryButton({required this.name, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage('http://192.168.0.109:8000/api/images/${image}')),
                borderRadius: BorderRadius.circular(15) ,
              ),
              height: 70,
              width: 100,
            ),
            const SizedBox(height: 10,),
            Text(name, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700
            ),),
          ],
        ),
      ),
    );
  }
}