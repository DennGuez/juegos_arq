import 'package:flutter/material.dart';
import 'package:juegos_arq/screens/contactos/contactos_screen.dart';
import 'package:juegos_arq/screens/home/home_screen.dart';

class FooterButtons extends StatelessWidget {
  final String? screenView;

  const FooterButtons({ this.screenView, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector( 
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => ContactosScreen()));
            },
            child: screenView != 'contactos' ? CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red,
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ) : Container()
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red,
              child: Icon(Icons.home, color: Colors.white, size: 30),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red,
              child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
            ),
          ),
        ]
      ),
    );
  }
}
