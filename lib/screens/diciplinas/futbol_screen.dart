import 'package:flutter/material.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';

// import 'package:url_launcher/url_launcher.dart';

class FutbolScreen extends StatelessWidget {
  final String diciplina;
  const FutbolScreen({super.key, required this.diciplina});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background-arq.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 150),
                child: Text(
                  diciplina,
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
                    itemCount: diciplinasList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpansionTile(
                        title: Text(
                          diciplina == 'FUTBOL'
                              ? diciplinasList[index]['modalidades'][0]['nombre']
                              : 'asdjkfhkas',
                          style: TextStyle(color: Colors.white),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'CATEGORÍA MASTER',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'CATEGORÍA MASTER ORO',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
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

List<Map<String, dynamic>> diciplinasList = [
  {
    "nombre": "FUTBOL",
    "modalidades": [
      {
        "nombre": "FUTBOL 8 VARONES",
        "categorias": ["CATEGORÍA MASTER", "CATEGORÍA MASTER ORO"]
      },
      {
        "nombre": "FUTBOL 11 VARONES",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      }
    ]
  },
  {
    "nombre": "FUTBOL DE SALON",
    "modalidades": [
      {
        "nombre": "FUTBOL DE SALON VARONES",
        "categorias": [
          "CATEGORÍA LIBRE",
          "CATEGORÍA SENIOR",
          "CATEGORÍA MASTER",
          "CATEGORÍA MASTER ORO"
        ]
      },
      {
        "nombre": "FUTBOL DE SALON DAMAS",
        "categorias": ["CATEGORÍA LIBRE"]
      }
    ]
  },
  {
    "nombre": "BÁSQUETBOL",
    "modalidades": [
      {
        "nombre": "BÁSQUETBOL VARONES",
        "categorias": [
          "CATEGORÍA LIBRE",
          "CATEGORÍA SENIOR",
          "CATEGORÍA MASTER"
        ]
      },
      {
        "nombre": "BÁSQUETBOL DAMAS",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      }
    ]
  },
  {
    "nombre": "VOLEIBOL",
    "modalidades": [
      {
        "nombre": "VOLEIBOL VARONES",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      },
      {
        "nombre": "VOLEIBOL DAMAS",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      }
    ]
  },
  {
    "nombre": "WALLY",
    "modalidades": [
      {
        "nombre": "WALLY VARONES",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      },
      {
        "nombre": "WALLY DAMAS",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      },
      {
        "nombre": "WALLY MIXTO",
        "categorias": ["CATEGORÍA LIBRE"]
      }
    ]
  },
  {
    "nombre": "VOLEIBOL DE PLAYA",
    "modalidades": [
      {
        "nombre": "VOLEIBOL DE PLAYA VARONES",
        "categorias": ["CATEGORÍA LIBRE"]
      },
      {
        "nombre": "VOLEIBOL DE PLAYA DAMAS",
        "categorias": ["CATEGORÍA LIBRE"]
      }
    ]
  },
  {
    "nombre": "RAQUET",
    "modalidades": [
      {
        "nombre": "RAQUET VARONES INDIVIDUAL",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      },
      {
        "nombre": "RAQUET VARONES DOBLE",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      },
      {
        "nombre": "RAQUET DAMAS INDIVIDUAL",
        "categorias": ["CATEGORÍA LIBRE"]
      },
      {
        "nombre": "RAQUET DAMAS DOBLE",
        "categorias": ["CATEGORÍA LIBRE"]
      }
    ]
  },
  {
    "nombre": "RAQUET FRONTÓN",
    "modalidades": [
      {
        "nombre": "RAQUET FRONTÓN VARONES INDIVIDUAL",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      },
      {
        "nombre": "RAQUET FRONTÓN VARONES DOBLE",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      },
      {
        "nombre": "RAQUET FRONTÓN DAMAS INDIVIDUAL",
        "categorias": ["CATEGORÍA LIBRE"]
      },
      {
        "nombre": "RAQUET FRONTÓN DAMAS DOBLE",
        "categorias": ["CATEGORÍA LIBRE"]
      }
    ]
  },
  {
    "nombre": "TENIS",
    "modalidades": [
      {
        "nombre": "TENIS VARONES",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      },
      {
        "nombre": "TENIS DAMAS",
        "categorias": ["CATEGORÍA LIBRE", "CATEGORÍA SENIOR"]
      },
      {
        "nombre": "TENIS DOBLES MIXTO",
        "categorias": ["CATEGORÍA LIBRE"]
      }
    ]
  },
  {
    "nombre": "TENIS DE MESA",
    "modalidades": [
      {
        "nombre": "TENIS DE MESA VARONES SIMPLES",
        "categorias": ["CATEGORÍA LIBRE"]
      },
      {
        "nombre": "TENIS DE MESA DAMAS SIMPLES",
        "categorias": ["CATEGORÍA LIBRE"]
      }
    ]
  },
  {
    "nombre": "AJEDREZ",
    "modalidades": [
      {
        "nombre": "AJEDREZ ABIERTO",
        "categorias": ["CATEGORÍA LIBRE"]
      }
    ]
  }
];
