import 'package:flutter/material.dart';
import 'package:juegos_arq/screens/diciplinas/widgets/filter_card.dart';
import 'package:juegos_arq/shared/widgets/background_image.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FixtureFilterPage extends StatelessWidget {
  String discipline;
  String category;
  String modality;

  FixtureFilterPage({super.key, required this.category, required this.discipline, required this.modality});

  @override
  Widget build(BuildContext context) {
  int firstSpaceIndex = category.indexOf(' ');
  final future = Supabase.instance.client
          .from('partidos')
          .select('*')
          .eq('disciplina', discipline)
          .eq('modalidad', modality)
          .eq('categoria', category.substring(firstSpaceIndex + 1));

    return Scaffold(
      body: Stack(
        children: [
          const backgroundImage(),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: Text(
                  discipline,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Telemarines',
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
                ),
              ),
              // FUTURE HERE
              FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final partidos = snapshot.data!;
                    // Lista que agrupa los eventos por fecha como sublistas
                  List<List<Map<String, dynamic>>> eventosPorFecha = [];
                    // Obtener las fechas únicas
                  Set fechasUnicas = partidos.map((evento) => evento['fecha']).toSet();

                    // Agrupar los eventos por cada fecha única
                  for (var fecha in fechasUnicas) {
                    List<Map<String, dynamic>> eventosDeFecha = partidos.where((evento) {
                      return evento['fecha'] == fecha;
                    }).toList();
                    
                    eventosPorFecha.add(eventosDeFecha);
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: eventosPorFecha.length,
                      itemBuilder: ((context, index) {
                        // final fecha = eventosPorFecha[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(eventosPorFecha[index][0]['fecha'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: eventosPorFecha[index].length,
                              itemBuilder: (context, index2) {
                                return FilterCard(
                                  title: eventosPorFecha[index][index2]['partido'], 
                                  subtitle: eventosPorFecha[index][index2]['categoria']
                                );
                              },
                            )
                          ]
                        );
                      })),
                  );
                    })
            ],
          )
        ],
      ),
    );
  }
}




