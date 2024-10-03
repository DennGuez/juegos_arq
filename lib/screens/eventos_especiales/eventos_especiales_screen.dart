import 'package:flutter/material.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';

import 'package:url_launcher/url_launcher.dart';

class EventosEspecialesScreen extends StatelessWidget {
  const EventosEspecialesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo
          backgroundImage(),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 150),
                child: const Text(
                  'EVENTOS ESPECIALES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Contenido
              Expanded(
                child: ListView.builder(
                    itemCount: eventosList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    SecondPage(evento: index)));
                          },
                          child: GameCard(
                            title: eventosList[index]['name'],
                          ));
                    }),
              ),
              // Footer Buttons
              FooterButtons(),
            ],
          )
        ],
      ),
    );
  }
}

/* SECOND PAGE */
class SecondPage extends StatelessWidget {
  final int evento;
  const SecondPage({required this.evento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        backgroundImage(),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Text(
                      eventosList[evento]['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Telemarines',
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      eventosList[evento]['date'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      eventosList[evento]['hour'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // IMAGEN
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: 300,
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(eventosList[evento]['imagenUrl']),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(eventosList[evento]['descripcion'],
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(0, 245, 246, 245))
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse( eventosList[evento]['ubicacion']));
                    },
                    child: const Text(
                      'UBICACION',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              FooterButtons()
            ],
          )
        ],
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String title;
  // final String pantalla;
  GameCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      color: Color(0xff000643),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> eventosList = [
  {
    "name": "INAUGURACIÓN",
    "date": "MIERCOLES 06/NOV/24", 
    "imagenUrl": "https://i.postimg.cc/YqnWWT9s/temp-Imagec7-Np6-G.avif",
    "hour": "8:00 – 12:00 am",
    "descripcion": "RECIBIMIENTO A LAS DELEGACIONES VISITANTES Y ENTREGA DE CREDENCIALES PLAZA SEBASTIÁN PAGADOR. \nPOSTERIORMENTE DESFILE POR LA AV. CORNETA MAMANI CON DIRECCIÓN A COMPLEJO DEPORTIVO. \nACTO DE INAUGURACIÓN COLISEO EDUARDO LECLERE POLO.",
    "ubicacion": "https://maps.app.goo.gl/oy2yn3Rh7xKPCYgC8"
  },{
    "name": "CENA DE BIENVENIDA",
    "date": "MIERCOLES 06/NOV/24", 
    "imagenUrl": "https://i.postimg.cc/Wp7r2dPj/temp-Imagef3-Uctb.avif",
    "hour": "19:30 pm -  01:00 am",
    "descripcion": "CAMPO FERIAL 3 DE JULIO “PABELLÓN SUPAY”. \nCENA GOURMET. \nPRESENTACIONES ARTÍSTICAS. \nCONFRATERNIZACIÓN",
    "ubicacion": "https://maps.app.goo.gl/cS6aVno7k2eWE8Bf9"
  },{
    "name": "NOCHE DE TALENTOS Y KARAOKE",
    "date": "JUEVES 07/NOV/24",
    "hour": "18:30 pm -  00:00 am",
    "imagenUrl": "https://i.postimg.cc/5NNzjfxz/temp-Image-Zm-ZSOM.avif",
    "descripcion": "CAMPO FERIAL 3 DE JULIO “PABELLÓN SUPAY”. \nDESPIEGUE DEL TALENTO ARTÍSTICO, CULTURAL, ACTORAL DE CADA DELEGACIÓN. \n(Premiación a las 3 mejores representaciones). \nDEMOSTRACIÓN DE CAPACIDAD INTERPRETATIVA DE COLEGAS. \n(Premiación a las 3 mejores interpretaciones). \nINICIO DE CAMPEONATOS DE CACHO, FUTBOLÍN Y POOL.",
    "ubicacion": "https://maps.app.goo.gl/cS6aVno7k2eWE8Bf9"
  },{
    "name": "NOCHE DE JUEGOS RECREATIVOS",
    "date": "VIERNES 08/NOV/24", 
    "hour": "18:30 pm -  00:00 am",
    "imagenUrl": "https://i.postimg.cc/y823f90h/temp-Image-Ho90ti.avif",
    "descripcion": "CAMPO FERIAL 3 DE JULIO “PABELLÓN SUPAY”. \nCAMPERONATO DE CACHO. CAMPEONATO DE FUTBOLÍN",
    "ubicacion": "https://maps.app.goo.gl/cS6aVno7k2eWE8Bf9"
  },{
    "name": "NOCHE DE JUEGOS RECREATIVOS",
    "date": "VIERNES 08/NOV/24",
    "hour": "18:30 pm -  00:00 am",
    "imagenUrl": "https://i.postimg.cc/HnTywgXf/temp-Image0-Anoc-R.avif",
    "descripcion": "BILLAR POOL DOG (Calle Ayacucho entre La Plata y Presidente Montes). \nCAMPEONATO DE BILLAR (POOL)",
    "ubicacion": "https://maps.app.goo.gl/S5MW1SGteg57iDtz5"
  },{
    "name": "ARQUIMATCH",
    "date": "SABADO 09/NOV/24",
    "hour": "09:30 am -  14:00 pm",
    "imagenUrl": "https://i.postimg.cc/FR5cKcRF/temp-Imageu-QB9fq.avif",
    "descripcion": "CAMPO FERIAL 3 DE JULIO “ESPACIO ANEXO A PABELLÓN SUPAY”. \nJUEGOS DE HABILIDAD INDIVIDUAL Y DE TRABAJO EN EQUIPO. \nJUEGOS DE ANTAÑO (Recordando los juegos creativos y de habilidades motrices de Generaciones anteriores)",
    "ubicacion": "https://maps.app.goo.gl/jTLXzFqdSv8DHCqV9"
  },{
    "name": "PREMIACIÓN Y CLAUSURA",
    "date": "SABADO 09/NOV/24", 
    "hour": "14:30 pm - 16:30 pm",
    "imagenUrl": "https://i.postimg.cc/TwJyY4FQ/temp-Image-SMsd-OI.avif",
    "descripcion": "PREMIACIÓN Y CLAUSURA. \nPLATO DE CONFRATERNIZACIÓN. \nDESPEDIDA A LAS DELEGACIONES",
    "ubicacion": "https://maps.app.goo.gl/jTLXzFqdSv8DHCqV9"
  }
];
