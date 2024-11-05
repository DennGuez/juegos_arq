import 'package:flutter/material.dart';
import 'package:juegos_arq/screens/login/add_partido.dart';
import 'package:juegos_arq/screens/login/add_resultados.dart';

class MenuLogin extends StatelessWidget {
  const MenuLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000643),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 205, 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  Navigator.push( context,
                    MaterialPageRoute(
                        builder: (context) => const AddGame()));
                }, 
                child: Text(
                  'Añadir Partido',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                )
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 205, 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {}, 
                child: Text(
                  'Añadir Ganador',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                )
              ),
            ),
            SizedBox(height: 20),      
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 205, 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  Navigator.push( context,
                    MaterialPageRoute(
                        builder: (context) => const AddResultado()));
                }, 
                child: Text(
                  'Añadir Resultados',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}