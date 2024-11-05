import 'package:flutter/material.dart';
import 'package:juegos_arq/screens/diciplinas/fixture_filtered_page.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';

class FixturesResultadosScreen extends StatelessWidget {
  const FixturesResultadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo
          const backgroundImage(),
          Column(
            children: [
              // TITLE
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: const Text(
                  'FIXTURE Y RESULTADOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
              // Contenido
              Expanded(
                child: Container(
                  child: ListView.separated(
                    itemCount: diciplinaList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      // BUTTON
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                          child: ExpansionTile(
                            iconColor: const Color(0xff151515),
                            collapsedIconColor: const Color(0xff151515),
                            title: Text(diciplinaList[index]['disciplina'], 
                              style: const TextStyle(color: Color.fromARGB(255, 21, 21, 21), fontWeight: FontWeight.w600, fontSize: 19),),
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: diciplinaList[index]['modalidad'].length,
                                itemBuilder: (context, index2) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xfffecd00),

                                    ),
                                    child: ExpansionTile(
                                      iconColor: const Color(0xff151515),
                                      collapsedIconColor: const Color(0xff151515),
                                      title: Text(diciplinaList[index]['modalidad'][index2]['nombre'], style: const TextStyle(color: Color.fromARGB(255, 21, 21, 21), fontSize: 18),),
                                      children: [
                                        // Text(diciplinaList[index]['modalidad'][index2]['categoria'][0])
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics: const ClampingScrollPhysics(),
                                          itemCount: diciplinaList[index]['modalidad'][index2]['categoria'].length,
                                          itemBuilder: (context, index3) {
                                            return GestureDetector(
                                              onTap: () {
                                                // partidoId: diciplinaList[index]['modalidad'][index2]['categoria'][index3]
                                                Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) => FixtureFilterPage(
                                                    category: diciplinaList[index]['modalidad'][index2]['categoria'][index3],
                                                    discipline: diciplinaList[index]['disciplina'],
                                                    modality: diciplinaList[index]['modalidad'][index2]['nombre']
                                                  ))); 
                                              },
                                              child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xfff1747b)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                                    child: Text(diciplinaList[index]['modalidad'][index2]['categoria'][index3], 
                                                      style: const TextStyle(
                                                        color: Color.fromARGB(255, 21, 21, 21), 
                                                        fontSize: 17, 
                                                        fontWeight: FontWeight.w400
                                                        ),),
                                                  )
                                                ),
                                            );
                                          },
                                          )
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                          );
                     },
                    ),
                ),
              ),
              const SizedBox(height: 20),
              // Footer Buttons
              const FooterButtons(),
            ],
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> diciplinaList = [
  {
      "disciplina": "FUTBOL",
      "modalidad": [
          {
              "nombre": "FUTBOL 8 VARONES",
              "categoria": [
                  "CATEGORÍA MASTER",
                  "CATEGORÍA MASTER ORO"
              ]
          },
          {
              "nombre": "FUTBOL 11 VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          }
      ]
  },
  {
      "disciplina": "FUTBOL DE SALON",
      "modalidad": [
          {
              "nombre": "FUTBOL DE SALON VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER",
                  "CATEGORÍA MASTER ORO"
              ]
          },
          {
              "nombre": "FUTBOL DE SALON DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE"
              ]
          }
      ]
  },
  {
      "disciplina": "BÁSQUETBOL",
      "modalidad": [
          {
              "nombre": "BÁSQUETBOL VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          },
          {
              "nombre": "BÁSQUETBOL DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          }
      ]
  },
  {
      "disciplina": "VOLEIBOL",
      "modalidad": [
          {
              "nombre": "VOLEIBOL VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "VOLEIBOL DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          }
      ]
  },
  {
      "disciplina": "WALLY",
      "modalidad": [
          {
              "nombre": "WALLY VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "WALLY DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "WALLY MIXTO",
              "categoria": [
                  "CATEGORÍA LIBRE"
              ]
          }
      ]
  },
  {
      "disciplina": "VOLEIBOL DE PLAYA",
      "modalidad": [
          {
              "nombre": "VOLEIBOL DE PLAYA VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE"
              ]
          },
          {
              "nombre": "VOLEIBOL DE PLAYA DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE"
              ]
          }
      ]
  },
  {
      "disciplina": "RAQUETBOL",
      "modalidad": [
          {
              "nombre": "RAQUET VARONES INDIVIDUAL",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "RAQUET VARONES DOBLE",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "RAQUET DAMAS INDIVIDUAL",
              "categoria": [
                  "CATEGORÍA LIBRE"
              ]
          }
      ]
  },
  {
      "disciplina": "RAQUETA FRONTÓN",
      "modalidad": [
          {
              "nombre": "RAQUET FRONTÓN VARONES DOBLE",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          }
      ]
  },
  {
      "disciplina": "TENIS",
      "modalidad": [
          {
              "nombre": "TENIS VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "TENIS DOBLES MIXTO",
              "categoria": [
                  "CATEGORÍA LIBRE"
              ]
          }
      ]
  },
  {
      "disciplina": "TENIS DE MESA",
      "modalidad": [
          {
              "nombre": "TENIS DE MESA VARONES SIMPLES",
              "categoria": [
                  "CATEGORÍA LIBRE"
              ]
          },
          {
              "nombre": "TENIS DE MESA DAMAS SIMPLES",
              "categoria": [
                  "CATEGORÍA LIBRE"
              ]
          }
      ]
  },
  {
      "disciplina": "AJEDREZ",
      "modalidad": [
          {
              "nombre": "AJEDREZ ABIERTO",
              "categoria": [
                  "CATEGORÍA LIBRE"
              ]
          }
      ]
  },
  {
      "disciplina": "ATLETISMO",
      "modalidad": [
          {
              "nombre": "100mts. VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER",
                  "CATEGORÍA MASTER ORO"
              ]
          },
          {
              "nombre": "200mts. VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER",
                  "CATEGORÍA MASTER ORO"
              ]
          },
          {
              "nombre": "400mts. VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER",
                  "CATEGORÍA MASTER ORO"
              ]
          },
          {
              "nombre": "1500mts. VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          },
          {
              "nombre": "5000mts. VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          },
          {
              "nombre": "CARRERA DE RELEVOS 4X100mts. MIXTO",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          },
          {
              "nombre": "SALTO LARGO VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          },
          {
              "nombre": "LANZAMIENTO DE BALA VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          },
          {
              "nombre": "LANZAMIENTO DE JABALINA VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          },
          {
              "nombre": "100mts. DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER",
                  "CATEGORÍA MASTER ORO"
              ]
          },
          {
              "nombre": "200mts. DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER",
                  "CATEGORÍA MASTER ORO"
              ]
          },
          {
              "nombre": "400mts. DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER",
                  "CATEGORÍA MASTER ORO"
              ]
          },
          {
              "nombre": "1500mts. DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          },
          {
              "nombre": "3000mts. DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          },
          {
              "nombre": "LANZAMIENTO DE BALA DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          }
      ]
  },
  {
      "disciplina": "TRIATLÓN",
      "modalidad": [
          {
              "nombre": "TRIATLÓN MIXTO",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          }
      ]
  },
  {
      "disciplina": "NATACIÓN",
      "modalidad": [
          {
              "nombre": "ESTILO LIBRE 50mts. VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "ESTILO ESPALDA 50mts. VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "ESTILO PECHO 50mts. VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "ESTILO MARIPOSA 50mts. VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "ESTILO COMBINADO CON RELEVOS VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "ESTILO LIBRE 50mts. DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "ESTILO ESPALDA 50mts. DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "ESTILO PECHO 50mts. DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "ESTILO MARIPOSA 50mts. DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          },
          {
              "nombre": "ESTILO COMBINADO CON RELEVOS DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR"
              ]
          }
      ]
  },
  {
      "disciplina": "CICLISMO",
      "modalidad": [
          {
              "nombre": "CICLISMO DE RUTA VARONES",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          },
          {
              "nombre": "CICLISMO DE RUTA DAMAS",
              "categoria": [
                  "CATEGORÍA LIBRE",
                  "CATEGORÍA SENIOR",
                  "CATEGORÍA MASTER"
              ]
          }
      ]
  }
];



