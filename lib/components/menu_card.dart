import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String name;
  final String price;
  final String category;
  final String description;
  final String image;
  MenuCard({required this.name, required this.price, required this.description, required this.category, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      margin: const EdgeInsets.only(
          left: 15, top: 5, bottom: 5, right: 15
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black54,
              blurRadius: 4,
              spreadRadius: 2
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            child: Image.network(
              image,
              fit: BoxFit.fill,
              height: 150,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text('\$ $price', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(category, style: const TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(description),
          )
        ],
      ),
    );
  }
}