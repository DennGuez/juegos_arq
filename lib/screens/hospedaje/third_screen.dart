import 'package:flutter/material.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

/* THIRD PAGE */
class ThirdPage extends StatelessWidget {
  final dynamic hospedaje;
  final int hotelStars;

  const ThirdPage({required this.hospedaje, this.hotelStars = 0 });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const backgroundImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: hospedaje['imagenUrl'].isNotEmpty ? 95 : 220),
                child: Text(
                  hospedaje['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
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
            ),
              // IMAGEN
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: hospedaje['imagenUrl'].isNotEmpty ? 300 : 0,
                // margin: EdgeInsets.symmetric(horizontal: 20),
                child: hospedaje['imagenUrl'].isNotEmpty
                ? Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(hospedaje['imagenUrl']),
                )
                : SizedBox()
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  hospedaje['descripcion'],
                  style: const TextStyle(color: Colors.white, fontSize: 21),
                ),
              ),
              const SizedBox(
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
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(0, 245, 246, 245))
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse(hospedaje['ubicacion']));
                    },
                    child: const Text(
                      'UBICACION',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 20, 
              ),
              const FooterButtons()
            ],
          )
        ],
      ),
    );
  }
}