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
                      fontSize: 40,
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

// List<Map<String, dynamic>> hotelesList = [
//     {
//         "name": "HOTEL EDEN",
//         "stars": "5",
//         "imagenUrl": "https://i.postimg.cc/sXv9mXfP/temp-Imageal-ILFs.avif",
//         "number": "76139043",
//         "descripcion": "BAÑO PRIVADO, AGUA CALIENTE 24 HRS. TELEFONO EN CADA HAB. TV. CABLE, DESAYUNO BUFFET AMERICANO, INTERNET WI-FI,  CALEFACCION, SECADOR DE PELO, CAJA FUERTE, PISCINA, GIMNACIO Y FRIGOBAR.",
//         "ubicacion": "https://maps.app.goo.gl/tn27BuDfdnDi6WQv9"
//     },{
//         "name": "HOTEL VIRGEN DEL SOCAVON ",
//         "stars": "3",
//         "imagenUrl": "https://i.postimg.cc/Jnv32Ltf/temp-Image-UJl4-Sa.avif",
//         "number": "62800390",
//         "descripcion": "10 HAB. INDIVIDUALES, 2 HAB. DOBLES, 5 HAB.  MATRIMONIAL, 2 HAB. SIMPLES, 1 SUITE. TRANSPORTE PÚBLICO Y PRIVADO. ",
//         "ubicacion": "https://maps.app.goo.gl/JgGphQ3NqYTXkJed9 "
//     },{
//         "name": "HOTEL REGAL ",
//         "stars": "3",
//         "imagenUrl": "https://i.postimg.cc/6qFZYLbt/temp-Image-Ang8-ZM.avif",
//         "number": "786000511",
//         "descripcion": "BAÑO PRIVADO, AGUA CALIENTE 24 HRS. TELEFONO EN CADA HAB. TV. CABLE, DESAYUNO BUFFET. TRANSPORTE PUBLICO Y PRIVADO ",
//         "ubicacion": " https://maps.app.goo.gl/3pfbidBR4GvGuZc1A "
//     },{
//         "name": "HOTEL FLOREZ PLAZA",
//         "stars": "3",
//         "imagenUrl": "https://i.postimg.cc/8zQWv4rb/temp-Image-Y4xbm-F.avif",
//         "number": "68350145",
//         "descripcion": "7 HAB. SUITE, 12 HAB. DOBLES, 6 HAB. MATRIMONIALES, 5 HAB TRIPLES, 2 HAB.. CUADRUPLES, 1 HAB. QUINTUPLE, 2 HAB. SUITE SIMPLE, 3 HAB. SUITE MATRIMONIAL. TRANSPORTE PUBLICO Y PRIVADO",
//         "ubicacion": "https://maps.app.goo.gl/UGE1P5tRaZv59qHv8 "
//     },{
//         "name": "HOTEL MONARCA",
//         "stars": "3",
//         "imagenUrl": "https://i.postimg.cc/RVnKqyqF/temp-Image6-Czvbl.avif",
//         "number": "78600595",
//         "descripcion": "TOTAL 16 HABITACIONES: SIMPLES, DOBLES, TRIPLES Y MATRIMONIALES ",
//         "ubicacion": "https://maps.app.goo.gl/LgKEbZG9hF6ygE4C6 "
//     },{
//         "name": "HOTEL OPORTO",
//         "stars": "3",
//         "imagenUrl": "https://i.postimg.cc/qBF2J4JS/temp-Imagewze-Tq8.avif",
//         "number": "75705566",
//         "descripcion": "1 HAB. INDIVIDUAL , 1 HAB. MATRIMONIAL, 3 HAB. DOBLES, 4 HAB. TRIPLES, 5 HAB DOBLES CON BAÑO ",
//         "ubicacion": "https://maps.app.goo.gl/8ifmFy6t6BaEHmSC9"
//     },{
//         "name": "HOTEL GRAN SUCRE",
//         "stars": "3",
//         "imagenUrl": "https://i.postimg.cc/t436N63G/temp-Image7i-Bg-QT.avif",
//         "number": "72485891",
//         "descripcion": "20 HAB. SIMPLESL, 10 HAB. DOBLES, 12 HAB. MATRIMONIALES, 4 HAB. TRIPLES, 4 HAB. MATRIMONIALES MAS ADICIONAL, 1 HAB CUADRUPLE, 1 HAB. QUINTUPLE",
//         "ubicacion": "https://maps.app.goo.gl/uSCYeK3nsmtPkTUR6"
//     },{
//         "name": "HOTEL GRAN BOLIVIA",
//         "stars": "3",
//         "imagenUrl": "https://i.postimg.cc/hGKdyGsz/temp-Imagex2-XQ19.avif",
//         "number": "25241047",
//         "descripcion": "TRANSPORTE PUBLICO Y PRIVADO",
//         "ubicacion": "https://maps.app.goo.gl/9g6KSKEJDEvbF8on7"
//     },{
//         "name": "HOTEL SUMAJ WASI",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/5tpFZMKP/temp-Image46mbh-R.avif",
//         "number": "76155966",
//         "descripcion": "2 HAB. SIMPLES, 10 HAB. MATRIMONIALES, 4 HAB. DOBLES, 2 HAB. TRIPLES, 2 HAB. FAMILIARES, TRANSPORTE PUBLICO Y PRIVADO",
//         "ubicacion": "https://maps.app.goo.gl/yNxN24zzdDd7aXfd9"
//     },{
//         "name": "HOTEL GUTIERREZ",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/766T4Qpq/temp-Image-QOAfz-P.avif",
//         "number": "70412510",
//         "descripcion": "CAPACIDAD PARA 31 PERSONAS, HABITACIONES INDIVIDUALES, DOBLES, TRIPLES, CUADRUPLES. TRANSPORTE PUBLICO Y PRIVADO.",
//         "ubicacion": "https://maps.app.goo.gl/ihcLLcXEherwWkbb8"
//     },{
//         "name": "HOTEL GLORIOSO",
//         "stars": "4",
//         "imagenUrl": "https://i.postimg.cc/gJTL2HW8/temp-Imageze-Sz-Op.avif",
//         "number": "25272340",
//         "descripcion": "HAB DOBLE ESTANDAR, SOBLE SUPERIOR, FAMILIAR, SUITE, SUITE FAMILIAR.",
//         "ubicacion": "https://maps.app.goo.gl/j56y1dWPAxyKgL5c7"
//     },{
//         "name": "HOTEL LIPTON",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/7hJGGJHc/temp-Image-Xx-Sn-JI.avif",
//         "number": "67240125",
//         "descripcion": "",
//         "ubicacion": "https://maps.app.goo.gl/jx5VmiBEFr3dtR2q6"
//     },{
//         "name": "HOTEL BERNAL",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/XXMZwNXv/temp-Imaget-R9w-ZO.avif",
//         "number": "25279468",
//         "descripcion": "HAB. INDIVIDUAL , HAB. MATRIMONIAL, HAB. DOBLES, HAB. TRIPLES,  HAB DOBLES CON BAÑO COMPARTIDO, HABITACIONES ALFOMBRADAS. TRANSPORTE PUBLICO Y PRIVADO.",
//         "ubicacion": "https://maps.app.goo.gl/UEpDqsjujQa332uy6"
//     },{
//         "name": "HOTEL FOKLORE’S",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/L4JNBynd/temp-Imageh-YQ7p-X.avif",
//         "number": "67224767",
//         "descripcion": "TRANSPORTE PUBLICO Y PRIVADO.",
//         "ubicacion": "https://maps.app.goo.gl/7grR49v4kg5o3K6B9"
//     },{
//         "name": "HOTEL VIRGINIA",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/L4JNBynd/temp-Imageh-YQ7p-X.avif",
//         "number": "70366843",
//         "descripcion": "TRANSPORTE PUBLICO Y PRIVADO.",
//         "ubicacion": "https://maps.app.goo.gl/NfBDD4ynGnUWN9gq8"
//     },{
//         "name": "HOTEL ARENALES",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/X7FLtpfQ/temp-Imaget6-B5-HJ.avif",
//         "number": "25271846",
//         "descripcion": "HAB. INDIVIDUAL , HAB. MATRIMONIAL, HAB. DOBLES, HAB. TRIPLES,  HAB DOBLES CON BAÑO COMPARTIDO, HABITACIONES ALFOMBRADAS. TRANSPORTE PUBLICO Y PRIVADO.",
//         "ubicacion": "https://maps.app.goo.gl/z1WGL91pZXSAZM9A8"
//     },{
//         "name": "HOTEL KISWARA",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/K82fbxQF/temp-Imagez0oi-BI.avif",
//         "number": "72466766",
//         "descripcion": "HAB. INDIVIDUAL , HAB. MATRIMONIAL, HAB. DOBLES, HAB. TRIPLES. TRANSPORTE PUBLICO Y PRIVADO.",
//         "ubicacion": "https://maps.app.goo.gl/1WaYdTJBzfrF14Ew6"
//     },{
//         "name": "HOTEL LUCERO",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/P5Q4r9FD/temp-Imagen-INMcd.avif",
//         "number": "71967942",
//         "descripcion": "TRANSPORTE PUBLICO Y PRIVADO.",
//         "ubicacion": "https://maps.app.goo.gl/w7jzYQTVAEoYsjqN7"
//     },{
//         "name": "HOTEL AZUL REAL",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/25jxqGPK/temp-Image-DXc-BLR.avif",
//         "number": "73030787",
//         "descripcion": "TRANSPORTE PUBLICO Y PRIVADO.",
//         "ubicacion": "https://maps.app.goo.gl/TdrH2q2xrZmb1MjA9"
//     },{
//         "name": "HOTEL TERMINAL",
//         "stars": "2",
//         "imagenUrl": "https://i.postimg.cc/s2n45SzD/temp-Imageg-VVJhf.avif",
//         "number": "25276227",
//         "descripcion": "TRANSPORTE PUBLICO Y PRIVADO.",
//         "ubicacion": "https://maps.app.goo.gl/bE9EgkVjHejkHfuR7"
//     }
// ];

// List<Map<String, dynamic>> residencialesList = [
//     {
//         "name": "RESIDENCIAL ARCANGEL MIGUEL",
//         "stars": "",
//         "imagenUrl": "",
//         "number": "25276183",
//         "descripcion": "HAB. INDIVIDUAL , HAB. MATRIMONIAL, HAB. DOBLES, HAB. TRIPLES",
//         "ubicacion": "https://maps.app.goo.gl/QPQgEHozQyEqhyPC7"
//     },{
//         "name": "RESIDENCIAL THUNUPA",
//         "stars": "",
//         "imagenUrl": "",
//         "number": "72498989",
//         "descripcion": "CUENTA CON HABITACIONES INDIVIDUAL, DOBLES, MATRIMONIALES, TRIPLES, C/BAÑO PRIVADO Y COMPARTIDO, BAÑO PRIVADO/COMPARTIDO, TV/CABLE , WI FI , AGUA CALIENTE.",
//         "ubicacion": "https://maps.app.goo.gl/8oafpyttY9EBtjNCA"
//     },{
//         "name": "RESIDENCIAL SAN SALVADOR",
//         "stars": "",
//         "imagenUrl": "",
//         "number": "72469638",
//         "descripcion": "HAB. INDIVIDUAL, HAB. MATRIMONIAL, HAB. DOBLES, HAB. TRIPLES. CON BAÑO PRIVADO Y BAÑO COMPARTIDO, COMEDOR, TV/CABLE, SALA DE ESTAR Y CAJA DE SEGURIDAD.",
//         "ubicacion": "https://maps.app.goo.gl/V1T4xnc7iJKb8TKn6"
//     },{
//         "name": "RESIDENCIAL HINOJOSA",
//         "stars": "",
//         "imagenUrl": "",
//         "number": "72484189",
//         "descripcion": "14 HAB. ENTRE  HAB. INDIVIDUAL , HAB. MATRIMONIAL, HAB. DOBLES, HAB. TRIPLES. BAÑO PRIVADO, TV/CABLE , WI FI , AGUA CALIENTE, DESAYUNO DE CORTESIA",
//         "ubicacion": "https://maps.app.goo.gl/z9WBThUY5XZ6YdJ36"
//     },{
//         "name": "RESIDENCIAL VERGARA",
//         "stars": "",
//         "imagenUrl": "",
//         "number": "25275259",
//         "descripcion": "HAB. INDIVIDUAL , HAB. MATRIMONIAL, HAB. DOBLES, HAB. TRIPLES. CON BAÑO PRIVADO Y BAÑO COMPARTIDO, COMEDOR, TV/CABLE, SALA DE ESTAR, PATIO Y LAVANDERIA.",
//         "ubicacion": "https://maps.app.goo.gl/iabCj12rQXDrpftQ6"
//     },{
//         "name": "RESIDENCIAL GRAN BOSTON",
//         "stars": "",
//         "imagenUrl": "",
//         "number": "25274708",
//         "descripcion": "HAB. INDIVIDUAL , HAB. MATRIMONIAL, HAB. DOBLES, HAB. TRIPLES. CON BAÑO PRIVADO Y BAÑO COMPARTIDO, PATIO, TV, AGUA CALIENTE 24 HORAS.",
//         "ubicacion": "https://maps.app.goo.gl/jpNjSs1gErML4TkH6"
//     },{
//         "name": "RESIDENCIAL VERANO",
//         "stars": "",
//         "imagenUrl": "",
//         "number": "25276542",
//         "descripcion": "HAB. INDIVIDUAL , HAB. MATRIMONIAL, HAB. DOBLES, HAB. FAMILIARES. CON BAÑO PRIVADO Y BAÑO COMPARTIDO,AIRE ACONDICIONADO, TV, AGUA CALIENTE 24 HORAS.",
//         "ubicacion": "https://maps.app.goo.gl/JHMQKEzfvGomufTaA"
//     },{
//         "name": "RESIDENCIAL EL EXPRESO",
//         "stars": "",
//         "imagenUrl": "",
//         "number": "70768052",
//         "descripcion": "HAB. INDIVIDUAL , HAB. MATRIMONIAL, HAB. DOBLES, HAB. TRIPLES",
//         "ubicacion": "https://maps.app.goo.gl/1spSweCAySJE2ySn6"
//     },{
//         "name": "RESIDENCIAL BACKOVIC",
//         "stars": "",
//         "imagenUrl": "",
//         "number": "76150805",
//         "descripcion": "HAB. INDIVIDUAL , HAB. MATRIMONIAL, HAB. DOBLES, HAB. FAMILIARES. CON BAÑO PRIVADO Y BAÑO COMPARTIDO, TV, AGUA CALIENTE 24 HORAS.",
//         "ubicacion": "https://maps.app.goo.gl/e1kp3axsB81WfdZd8"
//     }
// ];