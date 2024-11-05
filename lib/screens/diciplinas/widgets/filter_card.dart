import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const FilterCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      color: const Color(0xff000643),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 18.5,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            // const SizedBox(height: 5),
            // Text(
            //   'Inicio: $time',
            //   style: const TextStyle(
            //     fontSize: 18.5,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}