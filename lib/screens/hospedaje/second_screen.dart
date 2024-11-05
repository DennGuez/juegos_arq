import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:juegos_arq/screens/hospedaje/third_screen.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';
import 'package:juegos_arq/shared/widgets/info_card.dart';

/* SECOND PAGE */
class SecondPage extends StatefulWidget {
  final String categoria;
  const SecondPage({super.key, required this.categoria});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List _data = [];

  Future<void> readJson() async {
    final String res = await rootBundle.loadString(
      widget.categoria == 'HOTELES' ? 'assets/hoteles.json' :
      widget.categoria == 'RESIDENCIALES' ? 'assets/residenciales.json' : 
      widget.categoria == 'ALOJAMIENTOS' ? 'assets/alojamientos.json' :
      'assets/hostales.json'
    );
    final data = await jsonDecode(res);
    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo
          const backgroundImage(),
          Column(
            children: [
              // TITULO
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 100),
                child: const Text(
                  "Categoria",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ThirdPage(
                                hospedaje: _data[index],
                                hotelStars: int.parse(_data[index]['stars']),
                              )));
                          },
                          child: InfoCard(
                            name: _data[index]['name'],
                            hotelStars: int.parse(_data[index]['stars']),
                          ));
                    }),
              ),
              const FooterButtons()
            ],
          )
        ],
      ),
    );
  }
}