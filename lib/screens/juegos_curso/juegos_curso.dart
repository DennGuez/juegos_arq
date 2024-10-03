import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
// import 'package:juegos_arq/shared/widgets/footer_buttons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JuegosEnCurso extends StatefulWidget {
  const JuegosEnCurso({super.key});

  @override
  State<JuegosEnCurso> createState() => _JuegosEnCursoState();
}

class _JuegosEnCursoState extends State<JuegosEnCurso> {
  TextEditingController controller = TextEditingController();
  final _notesStream = Supabase.instance.client.from('partidos').stream(primaryKey: ['id']);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const backgroundImage(),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: const Text(
                  'JUEGOS EN CURSO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Telemarines',
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              StreamBuilder<List<Map<String, dynamic>>>(
              stream: _notesStream, 
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                final partidos = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: partidos.length,
                  itemBuilder: (context, index) {
                  return GameCard(
                          title: partidos[index]['partido'],
                          subtitle: partidos[index]['categoria_test'],
                          time: partidos[index]['hora']
                    );
                  }
                );
              }
                    ),
            ],
          )
        ]
      ),
    );
    // return Scaffold(
    //   body: Stack(
    //     children: <Widget>[
    //       // Fondo
    //       backgroundImage(),
    //       Column(
    //         children: [
    //           Container(
    //             margin: const EdgeInsets.only(top: 100),
    //             child: const Text(
    //               'JUEGOS EN CURSO',
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontFamily: 'Telemarines',
    //                   color: Colors.white,
    //                   fontSize: 40,
    //                   fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //           // Contenido
    //           Expanded(
    //             child: ListView.builder(
    //                 itemCount: juegosEnCursoList.length,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return GestureDetector(
    //                     onTap: () {
    //                       // Navigator.of(context).push(MaterialPageRoute(
    //                       //     builder: (context) =>
    //                       //         SecondPage(juegoId: index)));
    //                     },
    //                     child: GameCard(
    //                         title: juegosEnCursoList[index]['name'],
    //                         subtitle: juegosEnCursoList[index]['categoria'],
    //                         time: juegosEnCursoList[index]['fecha']),
    //                   );
    //                 }),
    //           ),
    //         // Footer Buttons
    //         FooterButtons(),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}

class GameCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  GameCard({required this.title, required this.subtitle, required this.time});

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
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SecondPage extends StatelessWidget {
//   final int juegoId;
//   const SecondPage({required this.juegoId});

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(title: Text("Hero ListView Page 2")),
//     //   body: Text(
//     //     juegosEnCursoList[juegoId]['name']
//     //   )
//     // );
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           // Fondo
//         backgroundImage(),
//           Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(top: 100),
//                 child: Text(
//                   juegosEnCursoList[juegoId]['categoria'],
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontFamily: 'Telemarines',
//                       color: Colors.white,
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               // Contenido
//               SizedBox(height: 40),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(juegosEnCursoList[juegoId]['fecha'],
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold)),
//               ),
//               SizedBox(height: 40),
//               Text(juegosEnCursoList[juegoId]['name'],
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold)),
//               Text('Inicio: ${juegosEnCursoList[juegoId]['hora']}',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold)),
//               SizedBox(height: 40),

//               Expanded(child: ElevatedButton(onPressed: null, child: const Text('Ubicacion'))),
//       // Footer Buttons
//       FooterButtons()
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// List<Map<String, dynamic>> juegosEnCursoList = [
//   {
//     'name': 'Oruro vs. Cochabamba',
//     'categoria': 'Futsal varones',
//     'hora': '20:00 Hrs.',
//     'Ubicacion': 'Palcio',
//     'fecha': 'Jueves 11/12/24'
//   },
//   {
//     'name': 'Santa Cruz vs. El Alto',
//     'categoria': 'Tennis de mesa Damas',
//     'hora': 'Inicio: 19:00 Hrs.',
//     'Ubicacion': 'Palcio',
//     'fecha': 'Jueves 11/12/24'
//   },
//   {
//     'name': 'Varios',
//     'categoria': 'Natacion varones',
//     'hora': '21:00 Hrs.',
//     'Ubicacion': 'Palcio',
//     'fecha': 'Jueves 11/12/24'
//   },
//   {
//     'name': 'Oruro vs. Cochabamba',
//     'categoria': 'Futsal varones',
//     'hora': '20:00 Hrs.',
//     'Ubicacion': 'Palcio',
//     'fecha': 'Jueves 11/12/24'
//   },
//   {
//     'name': 'Santa Cruz vs. El Alto',
//     'categoria': 'Tennis de mesa Damas',
//     'hora': '19:00 Hrs.',
//     'Ubicacion': 'Palcio',
//     'fecha': 'Jueves 11/12/24'
//   }
// ];
