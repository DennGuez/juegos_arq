import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final int hotelStars;

  InfoCard({
      required this.name,
      this.hotelStars = 0,
});

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
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            hotelStars != 0 ?
            Container(
                  height: 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: hotelStars,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Icon(Icons.star_border, size: 31, color: Colors.white); 
                    }
                  ),
                )
          : Container()
          ],
        ),
      ),
    );
  }
}