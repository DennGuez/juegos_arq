import 'package:flutter/material.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';

import 'package:url_launcher/url_launcher.dart';

class ComidaScreen extends StatelessWidget {
  const ComidaScreen({super.key});

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
                  'COMIDA',
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
                    itemCount: comidasCategoriasList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            if ( comidasCategoriasList[index] == 'TRADICIONALES' ) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    SecondPage(categoria: index)));
                            }
                          },
                          child: GameCard(
                            title: comidasCategoriasList[index],
                            pantalla: 'COMIDA',
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

class GameCard extends StatelessWidget {
  final String title;
  // final String descripcion;
  final String pantalla;
  GameCard(
      {required this.title,
      // this.descripcion = 'a',
      required this.pantalla});

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
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // pantalla == 'RESTAURANTES'
            //     ? Text(descripcion, style: TextStyle(
            //       color: Colors.white, fontSize: 20
            //     ),)
            //     : Text('')
          ],
        ),
      ),
    );
  }
}

/* SECOND PAGE */
class SecondPage extends StatelessWidget {
  final int categoria;
  const SecondPage({required this.categoria});

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
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 120),
                child: Text(
                  comidasCategoriasList[categoria],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: comidasList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ThirdPage(
                                      comidaLugar: index,
                                    )));
                          },
                          child: GameCard(
                            title: comidasList[index]['name'],
                            // descripcion: comidasList[index]['tipo'],
                            pantalla: 'RESTAURANTES',
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

/* THIRD PAGE */
class ThirdPage extends StatelessWidget {
  final int comidaLugar;
  const ThirdPage({required this.comidaLugar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          const backgroundImage(),
          Column(
            // comidasList[comidaLugar]['name'] == 'TRANDICIONALES' ?
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 90),
                child: Text(
                  comidasList[comidaLugar]['name'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // IMAGEN
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                height: 300,
                // margin: EdgeInsets.symmetric(horizontal: 20),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(comidasList[comidaLugar]['imagenUrl']),
                ),
              ),
              // DESCRIPCION
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(comidasList[comidaLugar]['descripcion'],
                    style: const TextStyle(color: Colors.white, fontSize: 19)),
                ),
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
                      launchUrl(Uri.parse( comidasList[comidaLugar]['ubicacion']));
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

List<String> comidasCategoriasList = [
  'RESTAURANTES',
  'CAFES',
  'SNACKS',
  'TRADICIONALES'
];

List<Map<String, dynamic>> comidasList = [
{
"name": "API ORUREÑO",
"categoria": "TRANDICIONALES",
"imagenUrl": "https://i.postimg.cc/qqtSrBgd/temp-Image-YIRCqu.avif",
"descripcion": "El Api con Pastel, otro manjar típico de la ciudad de Oruro. Consiste en una deliciosa bebida caliente elaborada a base de maíz morado, endulzada y aromatizada con canela y clavo de olor. Se sirve acompañado de un pastel frito relleno de queso, creando una combinación perfecta entre lo dulce y lo salado. El api con pastel es ideal para disfrutar en las mañanas frías o como una merienda reconfortante, brindándote un sabor auténtico y tradicional de la región.",
"ubicacion": "https://maps.app.goo.gl/HEmHZKEtKttzLcg76",
},
{
"name": "CHARQUECAN ORUREÑO",
"categoria": "TRANDICIONALES",
"imagenUrl": "https://i.postimg.cc/mDpJK1Lw/temp-Image-KHense.avif",
"descripcion": "Este plato tradicional es una experiencia culinaria que no te puedes perder. Se trata de una exquisita preparación que combina charque de res o llama desmenuzado y frito, acompañado de huevo duro, mote, papa, queso y llajua, creando una mezcla de sabores y texturas únicas.",
"ubicacion": "https://maps.app.goo.gl/DmRHPC81DhjrzhY99",
},
{
"name": "CHORIZO TRADICIONAL",
"categoria": "TRANDICIONALES",
"imagenUrl": "https://i.postimg.cc/vTpjZR6x/temp-Imagen-Dd-ZSy.avif",
"descripcion": "Este delicioso plato tradicional de la ciudad de Oruro es una experiencia culinaria que no te puedes perder. Se trata de una exquisita preparación que combina carne de cerdo molida y tripa gorda de res, rellena con una mezcla de sabores y aromas únicos.",
"ubicacion": "https://maps.app.goo.gl/HEmHZKEtKttzLcg76",
},
{
"name": "HELADOS DE CANELA",
"categoria": "TRANDICIONALES",
"imagenUrl": "https://i.postimg.cc/66SF0Z16/temp-Image-XRHFy-J.avif",
"descripcion": "Este postre tradicional de la ciudad de Oruro es una delicia refrescante que no te puedes perder. Los heladitos de canela son una exquisita preparación que combina la suavidad del hielo con el inconfundible aroma y sabor de la canela.",
"ubicacion": "https://maps.app.goo.gl/DmRHPC81DhjrzhY99",
},
{
"name": "RESTAURANT NAYJAMA",
"categoria": "TRANDICIONALES",
"imagenUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-iVfSFCuSpcb7D1sPGlAH2RHmyCqEHmijEQ&s",
"descripcion": "Nayjama es un restaurante con mucha tradición en la ciudad, nació como un pequeño lugar de comida típica y con los años se ha convertido en un bonito y acogedor.",
"ubicacion": "https://maps.app.goo.gl/3qJJDenSMcJbPza99",
}
];


// List<Map<String, dynamic>> comidasList = [
//   {
//     'name': 'LA CASONA',
//     'categoria': 'RESTAURANTES',
//     'descripcion':
//         'Lugar de salteñas típicas….Especialidad…. Contactos…',
//     'tipo': 'Salteñas, pizzas, empanadas',
//     'ubicacion': 'https://maps.app.goo.gl/sNDYfqwYRTVN8eRj7',
//     'imagenUrl': 'https://lh3.googleusercontent.com/p/AF1QipObd-hig6kOBj5Kdbcqck7CKHXT6hPP68Hg9S2G=s1360-w1360-h1020'
//   },
//   {
//     'name': 'LA RANCHERIA',
//     'categoria': 'RESTAURANTES',
//     'descripcion':
//         'Choripanes especiales tipicos de oruro.',
//     'tipo': 'Choripanes especiales',
//     'ubicacion': 'https://maps.app.goo.gl/sNDYfqwYRTVN8eRj7',
//     'imagenUrl':
//         'https://lh3.googleusercontent.com/p/AF1QipObd-hig6kOBj5Kdbcqck7CKHXT6hPP68Hg9S2G=s1360-w1360-h1020'
//   },
//   {
//     'name': 'DOÑA RITA',
//     'categoria': 'RESTAURANTES',
//     'descripcion':
//         'Charkencan de carne de llama, una costumbre orureña',
//     'tipo': 'Chaquekan',
//     'ubicacion': 'https://maps.app.goo.gl/sNDYfqwYRTVN8eRj7',
//     'imagenUrl':
//         'https://lh3.googleusercontent.com/p/AF1QipObd-hig6kOBj5Kdbcqck7CKHXT6hPP68Hg9S2G=s1360-w1360-h1020'
//   },
//   {
//     'name': 'DOÑA CHAVELITA',
//     'categoria': 'RESTAURANTES',
//     'descripcion':
//         'Rostro asado ',
//     'tipo': 'Rostro asado de corderno',
//     'ubicacion': 'https://maps.app.goo.gl/sNDYfqwYRTVN8eRj7',
//     'imagenUrl':
//         'https://lh3.googleusercontent.com/p/AF1QipObd-hig6kOBj5Kdbcqck7CKHXT6hPP68Hg9S2G=s1360-w1360-h1020'
//   }
// ];