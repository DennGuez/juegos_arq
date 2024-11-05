import 'package:flutter/material.dart';
import 'package:juegos_arq/screens/hospedaje/second_screen.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';
import 'package:juegos_arq/shared/widgets/info_card.dart';

// import 'package:url_launcher/url_launcher.dart';

class HospedajeScreen extends StatelessWidget {
  const HospedajeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo
          const backgroundImage(),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 150),
                child: const Text(
                  'HOSPEDAJE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Contenido
              Expanded(
                child: ListView.builder(
                    itemCount: hospedajesCategoriasList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    SecondPage(categoria: hospedajesCategoriasList[index])));
                          },
                          child: InfoCard(
                            name: hospedajesCategoriasList[index],
                          ));
                    }),
              ),
              // Footer Buttons
              const FooterButtons(),
            ],
          )
        ],
      ),
    );
  }
}


List<String> hospedajesCategoriasList = [
  'HOTELES',
  'RESIDENCIALES',
  'ALOJAMIENTOS',
  'HOSTALES'
];