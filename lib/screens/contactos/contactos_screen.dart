import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:juegos_arq/screens/login/login_page.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactosScreen extends StatelessWidget {
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
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 100),
                child: const Text(
                  'CONTACTOS CON ORGANIZADORES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: organizadoresList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SecondPage(
                                    organizador: index,
                                  )));
                          },
                          child: GameCard(
                            // delegacion: organizadoresList[index]['name'],
                            charge: organizadoresList[index]['charge']
                          ));
                    }),
              ),
              const FooterButtons(screenView: 'contactos')
            ],
          )
        ],
      ),
    );
  }
}

/* SECOND PAGE */
// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  final int organizador;
  
  SecondPage({required this.organizador});
  
  var startTap = timeNow;
  var consecutiveTaps = 0;
  static const int serialTaps = 4;
  static const int tapDurationInMs = 1000;
  static int get timeNow => DateTime.now().millisecondsSinceEpoch;
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // body: Text(
      //   '${ hospedaje.toString() }'
      // )
      body: Stack(
        children: [
          // Fondo
          backgroundImage(),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 150),
                child: const Text(
                  'RESPONSABLE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                organizadoresList[organizador]['charge'],
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
              Text(
                organizadoresList[organizador]['name'],
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "(ORURO)",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  final now = timeNow;
                  final userExceededTapDuration = now - startTap > tapDurationInMs;

                  if (userExceededTapDuration) {
                    consecutiveTaps = 0;
                    startTap = now;
                  }

                  consecutiveTaps++;

                  if (consecutiveTaps == serialTaps && organizadoresList[organizador]['number'] == "+591 60435101") {
                    // widget.onTap();
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage()));
                  }
                },
                child: CachedNetworkImage(
                  imageUrl: organizadoresList[organizador]['imagenUrl'],
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill
                      )
                    ),
                  );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Button Square
                  Container(
                    padding: EdgeInsets.all(9),
                    child: SvgPicture.asset('assets/icons/whatsapp.svg',
                      width: 65,
                      height: 65,
                    )),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                    ),
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(
                                Color.fromARGB(0, 245, 246, 245))),
                        onPressed: () {
                          launchUrl(Uri.parse(
                              'https://wa.me/${organizadoresList[organizador]['number']}/'));
                        },
                        child: const Text(
                          'ABRIR WHATSAPP',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(child: FooterButtons( screenView: 'contactos'))
            ],
          )
        ],
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final String charge;

  GameCard({required this.charge});

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
              charge,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              textAlign: TextAlign.center,
              "ORURO",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> organizadoresList = [
  {
    "name": "ARQ. PACHA MARIO MOLINA ARCE",
    "charge": "PRESIDENTE DEL CAO.",
    "imagenUrl": "https://i.postimg.cc/Wb94yj62/temp-Imagemvn-Qqd.avif",
    "number": "+591 72465284",
    "city": "ORURO"
  },
  {
    "name": "ARQ. RADHARANI MIRIAM NAVAS CONDORCETT",
    "charge": "ORGANIZACION DEPORTIVA.",
    "imagenUrl": "https://i.postimg.cc/VkpkYRVp/temp-Imagegs8-AEh.avif",
    "number": "+591 72355975",
    "city": "ORURO"
  },
  {
    "name": "ARQ. ABNER GONZALES MEDINA",
    "charge": "MARETING Y PUBLICIDAD.",
    "imagenUrl": "https://scontent.fcbb2-1.fna.fbcdn.net/v/t1.6435-9/98001270_10219953828909545_7826167829131952128_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=e982cd&_nc_ohc=MTYyTjMq-DsQ7kNvgH9-NDs&_nc_zt=23&_nc_ht=scontent.fcbb2-1.fna&_nc_gid=ALd6Hs1yjgzWntkdWUVXzjS&oh=00_AYAJaUVc-uIIUttzvVEzQ-5lZqol-WsubOSFoEzjgls2Qg&oe=6736305E",
    "number": "+591 60435101",
    "city": "ORURO"
  }
];
