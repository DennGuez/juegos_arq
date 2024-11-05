import 'package:flutter/material.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class MatchFiltered extends StatelessWidget {
  final String partido;
  final String modalidad;
  final String disciplina;
  final dynamic resultado;
  final String ubicacion;

  const MatchFiltered({
    super.key, 
    required this.partido, 
    required this.disciplina, 
    required this.modalidad,
    required this.ubicacion,
    this.resultado = 'Por disputarse'
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          const backgroundImage(),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 200),
                child: Text(
                  disciplina,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            const SizedBox(height: 20),
             Container(
                child: Text(partido,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ),
              const SizedBox(height: 20),
              // PARTIDO
             Container(
                child: Text(modalidad,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ),
            // MODALIDAD
            const SizedBox(height: 20),
             Expanded(
                child: Text(resultado,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(0, 245, 246, 245))
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse(ubicacion));
                    },
                    child: const Text(
                      'UBICACION',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const FooterButtons()
            ],

          )
        ],
      ),
    );
  }
}