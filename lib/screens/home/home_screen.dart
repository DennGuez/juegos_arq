import 'package:flutter/material.dart';
import 'package:juegos_arq/screens/comida/comida_screen.dart';
import 'package:juegos_arq/screens/contactos/contactos_screen.dart';
import 'package:juegos_arq/screens/diciplinas/fixtures_resultados_screen.dart';
import 'package:juegos_arq/screens/eventos_especiales/eventos_especiales_screen.dart';
import 'package:juegos_arq/screens/home/widgets/menu_button.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:juegos_arq/screens/hospedaje/hospedaje_screen.dart';
import 'package:juegos_arq/screens/juegos_curso/juegos_curso.dart';
// import 'package:juegos_arq/screens/juegos_curso/juegos_curso.dart';
import 'package:juegos_arq/screens/lugares_turisticos/lugares_turisticos_screen.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:flutter_svg/svg.dart';

import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://drive.google.com/drive/folders/1-0AFWlvJcw688ZWto3YMh-Ngp6ByPekI');

final Uri _urlTiktok = Uri.parse(
    'https://www.tiktok.com/@colegiodearquitec64');

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          // Fondo
          const backgroundImage(),
          // Contenido
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 170,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: const Column(
                    children: [
                      CountdownTitiles(),
                      CountdownTimer()
                    ],
                  ),
                ),
                MenuButton('CONVOCATORIA Y AUSPICIADORES', Icons.picture_as_pdf, () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()) );
                  _launchUrl();
                }),
                MenuButton('FIXTURES Y RESULTADOS', Icons.calendar_today, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FixturesResultadosScreen()));
                }),
                MenuButton('JUEGOS EN CURSO', Icons.sports, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const JuegosEnCurso()));
                }),
                MenuButton('HOSPEDAJE', Icons.hotel, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HospedajeScreen()));
                }),
                MenuButton('GASTRONOMIA', Icons.restaurant, () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ComidaScreen()));
                }),
                MenuButton('LUGARES TURÍSTICOS', Icons.place, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LugaresTuristicosScreen()));
                          }),
            
                MenuButton('EVENTOS ESPECIALES', Icons.event, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EventosEspecialesScreen()));
                }),
                MenuButton('GANADORES', Icons.emoji_events, () {}),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactosScreen()));
                        },
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.person, color: Colors.white, size: 30),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _launchTiktok();
                        },
                        child: SvgPicture.asset('assets/icons/tiktok.svg',
                          width: 35,
                          height: 35,
                        ),
                      ))
                    ]
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return CountDownText(
      due: DateTime.parse("2024-11-06 00:00:00"),
      finishedText: "Done",
      showLabel: true,
      longDateName: true,
      daysTextLong: "   :   ",
      hoursTextLong: "   :   ",
      minutesTextLong: "   :   ",
      secondsTextLong: "",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CountdownTitiles extends StatelessWidget {
  const CountdownTitiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TimeTitle('DÍAS'),
        TimeTitle('HORAS'),
        TimeTitle('MINUTOS'),
        TimeTitle('SEGUNDOS'),
      ],
    );
  }
}

class TimeTitle extends StatelessWidget {
  final String title;
  TimeTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

/* Open Tiktok */
Future<void> _launchTiktok() async {
  if (!await launchUrl(_urlTiktok)) {
    throw Exception('Could not launch $_url');
  }
}
