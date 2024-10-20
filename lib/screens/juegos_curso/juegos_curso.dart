import 'package:flutter/material.dart';
import 'package:juegos_arq/screens/juegos_curso/game_card.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:juegos_arq/shared/widgets/footer_buttons.dart';
// import 'package:juegos_arq/shared/widgets/footer_buttons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JuegosEnCurso extends StatefulWidget {
  const JuegosEnCurso({super.key});

  @override
  State<JuegosEnCurso> createState() => _JuegosEnCursoState();
  
}

class _JuegosEnCursoState extends State<JuegosEnCurso> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
  final fechaActual = DateTime.now();
  final notesStream = Supabase.instance.client
    .from('partidos')
    .stream(primaryKey: ['id'])
    .eq('fecha', fechaActual);
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
              stream: notesStream, 
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                final partidos = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: partidos.length,
                    itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(partidoId: partidos[index]['id'])));
                      },
                      child: GameCard(
                              title: partidos[index]['partido'],
                              subtitle: '${partidos[index]['disciplina']} ${partidos[index]['modalidad']}', 
                              time: partidos[index]['hora']
                        ),
                    );
                    }
                  ),
                );
              }
              ),
            ],
          )
        ]
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final int partidoId;
  const SecondPage({super.key, required this.partidoId});
  @override
  State<SecondPage> createState() => _SecondPageState();
  
}

class _SecondPageState extends State<SecondPage> {
   late Future<List> _partido;
  @override
  /* Otra manera de hacer llamado a la api */
  // void initState() {
  //    _partido = Supabase.instance.client.from('partidos').select('*').eq('id', widget.partidoId);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    _partido = Supabase.instance.client
      .from('partidos')
      .select('*')
      .eq('id', widget.partidoId);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo
        const backgroundImage(),
        FutureBuilder<List>(
        future: _partido,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Column(
                children: [
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Text(
                    '${snapshot.data?.first['disciplina']}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Telemarines',
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              // Contenido
                const SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('${snapshot.data?.first['fecha']}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 40),
                Text('${snapshot.data?.first['partido']}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                Text('Inicio: ${snapshot.data?.first['hora']}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                // UBICACION BUTTON
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
                      // launchUrl(Uri.parse(hospedaje['ubicacion']));
                    },
                    child: const Text(
                      'UBICACION',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
                 const SizedBox(height: 40),
                // Footer Buttons
                const FooterButtons()
              ],
              )
                // child: Text('Result: ${snapshot.data?.first['partido']}', style: TextStyle(color: Colors.white), ),
              
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white),),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Cargando...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
              ),
      //     Column(
      //       children: [
      //         Container(
      //           margin: const EdgeInsets.only(top: 100),
      //           child: Text(
      //             'Categoria',
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //                 fontFamily: 'Telemarines',
      //                 color: Colors.white,
      //                 fontSize: 40,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         // Contenido
      //         SizedBox(height: 40),
      //         Container(
      //           width: MediaQuery.of(context).size.width,
      //           margin: const EdgeInsets.symmetric(horizontal: 20),
      //           child: Text('Fecha',
      //               style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 25,
      //                   fontWeight: FontWeight.bold)),
      //         ),
      //         SizedBox(height: 40),
      //         Text('Name',
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 40,
      //                 fontWeight: FontWeight.bold)),
      //         Text('Inicio: hora',
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 25,
      //                 fontWeight: FontWeight.bold)),
      //         SizedBox(height: 40),

      //         Expanded(child: ElevatedButton(onPressed: null, child: const Text('Ubicacion'))),
      // // Footer Buttons
      // // FooterButtons()
      //       ],
      //     )
        ],
      ),
    );
  }
}
