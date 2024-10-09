import 'package:flutter/material.dart';
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
    // print(fechaActual.toString().split(' ')[0]);
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
                              subtitle: partidos[index]['categoria_test'],
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

class GameCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const GameCard({required this.title, required this.subtitle, required this.time});

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
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 18.5,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Inicio: $time',
              style: const TextStyle(
                fontSize: 18.5,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final int partidoId;
  const SecondPage({required this.partidoId});
  @override
  State<SecondPage> createState() => _SecondPageState();
  
}

class _SecondPageState extends State<SecondPage> {
   late Future<List> _partido;
  @override
  void initState() {
     _partido = Supabase.instance.client.from('partidos').select('*').eq('id', widget.partidoId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo
        backgroundImage(),
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
                    '${snapshot.data?.first['categoria_test']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Telemarines',
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              // Contenido
                SizedBox(height: 40),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('${snapshot.data?.first['fecha']}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 40),
                Text('${snapshot.data?.first['partido']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                Text('Inicio: ${snapshot.data?.first['hora']}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 40),
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
                 SizedBox(height: 40),
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
                child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white),),
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
