import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddGame extends StatefulWidget {
  const AddGame({super.key});

  @override
  State<AddGame> createState() => _AddGameState();
}

class _AddGameState extends State<AddGame> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedDisciplina;
  String? _selectedModalidad;
  String? _selectedCategoria;
  Map<String, String>? _selectedCancha;

  DateTime? _selectedDate;
  String? titulo;
  String? resultado;

  final List<String> _disciplina = ['FUTBOL', 'FUTBOL DE SALON', 'BÁSQUETBOL', 'VOLEIBOL', 'WALLY', 'VOLEIBOL DE PLAYA', 'RÁQUETBOL', 'RAQUETA FRONTÓN', 'TENIS', 'TENIS DE MESA', 'AJEDREZ','ATLETISMO','TRIATLÓN','NATACIÓN', 'CICLISMO'];
  final List<String> _modalidad = [
  "FUTBOL 8 VARONES",
  "FUTBOL 11 VARONES",
  "FUTBOL DE SALON VARONES",
  "BÁSQUETBOL VARONES",
  "BÁSQUETBOL DAMAS",
  "VOLEIBOL VARONES",
  "VOLEIBOL DAMAS",
  "WALLY VARONES",
  "WALLY DAMAS",
  "WALLY MIXTO",
  "VOLEIBOL DE PLAYA VARONES",
  "VOLEIBOL DE PLAYA DAMAS",
  "RAQUET VARONES INDIVIDUAL",
  "RAQUET VARONES DOBLE",
  "RAQUET DAMAS INDIVIDUAL",
  "RAQUET FRONTÓN VARONES DOBLE",
  "TENIS VARONES",
  "TENIS DOBLES MIXTO",
  "TENIS DE MESA VARONES SIMPLES",
  "TENIS DE MESA DAMAS SIMPLES",
  "AJEDREZ ABIERTO",
  "100mts. VARONES",
  "200mts. VARONES",
  "400mts. VARONES",
  "1500mts. VARONES",
  "5000mts. VARONES",
  "SALTO LARGO VARONES",
  "LANZAMIENTO DE BALA VARONES",
  "LANZAMIENTO DE JABALINA VARONES",
  "100mts. DAMAS",
  "200mts. DAMAS",
  "400mts. DAMAS",
  "1500mts. DAMAS",
  "3000mts. DAMAS",
  "CARRERA DE RELEVOS 4X100mts. MIXTO",
  "LANZAMIENTO DE BALA DAMAS",
  "TRIATLÓN VARONES",
  "TRIATLÓN MIXTO",
  "ESTILO LIBRE 50mts. VARONES",
  "ESTILO ESPALDA 50mts. VARONES",
  "ESTILO PECHO 50mts. VARONES",
  "ESTILO MARIPOSA 50mts. VARONES",
  "ESTILO COMBINADO CON RELEVOS VARONES",
  "ESTILO LIBRE 50mts. DAMAS",
  "ESTILO ESPALDA 50mts. DAMAS",
  "ESTILO PECHO 50mts. DAMAS",
  "ESTILO MARIPOSA 50mts. DAMAS",
  "ESTILO COMBINADO CON RELEVOS DAMAS",
  "CICLISMO DE RUTA VARONES",
  "CICLISMO DE RUTA DAMAS"
];

final List<String> _categorias = ['MASTER', 'MASTER ORO', 'LIBRE', 'SENIOR'];
final List<String> _resultado = ['SI', 'NO'];
final List<Map<String, String>> canchas = [
 {'nombre': 'Cancha Fac Tec 1 Exterior.',
 'ubicacion': 'https://maps.app.goo.gl/niUt48uf5HMCTpwC9'},
 {'nombre': 'Cancha Fac Tec 2 Interior.',
 'ubicacion': 'https://maps.app.goo.gl/niUt48uf5HMCTpwC9'},
 {'nombre': 'Círculo de periodistas de Oruro',
 'ubicacion': 'https://maps.app.goo.gl/5owmPcPcDfvWtmeW6'},
 {'nombre': 'Palacio de los deportes [Eduardo Leclere]',
  'ubicacion': 'https://maps.app.goo.gl/hh8SouV2dTX7eg8aA'},
 {'nombre': 'Coliseo Barrios Mineros',
  'ubicacion': 'https://maps.app.goo.gl/n38q1i8YNySYJc8JA'},
 {'nombre': 'Polifuncional de Economía',
  'ubicacion': 'https://maps.app.goo.gl/a5xJoMDD6YmiEFQBA'},
 {'nombre': 'Coliseo Las Americas',
  'ubicacion': 'https://maps.app.goo.gl/NwpJ4aQE4MiiRVJx7'},
 {'nombre': 'Cancha de cesped Las Americas',
  'ubicacion': 'https://maps.app.goo.gl/pEooW9fKTWcoihYD8'},
 {'nombre': 'Asociación Municipal de Volleyball ',
  'ubicacion': 'https://maps.app.goo.gl/LnPygHoWKBo3i7Xb6'},
 {'nombre': 'Minicoliseo',
  'ubicacion': 'https://maps.app.goo.gl/upfXzTYBSPpJsQ3n7'},
 {'nombre': 'Jesbert 3',
  'ubicacion': 'https://maps.app.goo.gl/WAqEZjBp5mWUX1bM8'},
 {'nombre': 'Jesbert 4',
  'ubicacion': 'https://maps.app.goo.gl/BNoyLQ1iF8UwNixt5'},
 {'nombre': 'Jesbert 2',
  'ubicacion': 'https://maps.app.goo.gl/zEbaLGUSL6YNyPee9'},
 {'nombre': 'Cancha C',
  'ubicacion': 'https://maps.app.goo.gl/D8EnMZkuS7oAXGjL8'},
 {'nombre': 'Complejo de Raquetball',
  'ubicacion': 'https://maps.app.goo.gl/aA7g3Z9NknVPBsyy7'},
 {'nombre': 'Cancha de Raqueta Frontón Sedede',
  'ubicacion': 'https://maps.app.goo.gl/nVYhgHUQCy8uz6nS6'},
 {'nombre': 'Asociación de Tennis de mesa',
  'ubicacion': 'https://maps.app.goo.gl/kXj4WxmswTw5qhVF9'},
 {'nombre': 'Stadium Jesús Bermudez',
  'ubicacion': 'https://maps.app.goo.gl/kGMnczEEWywhe4pU8'},
 {'nombre': 'Piscina olímpica Sedede',
  'ubicacion': 'https://maps.app.goo.gl/17ZRCPkK3PFd8z8L9'},
 {'nombre': 'Piscina Semiolímpica de Capachos',
  'ubicacion': 'https://maps.app.goo.gl/9VAP3McaXcYZcxN49'},
 {'nombre': 'Cancha de cesped sintético Las Americas [Rafael Pabon]',
  'ubicacion': 'https://maps.app.goo.gl/pEooW9fKTWcoihYD8'},
 {'nombre': 'Cancha pasto sintético Ex Metabol',
  'ubicacion': 'https://maps.app.goo.gl/BMb5kzuZgfA6m1qb9'},
 {'nombre': 'Cancha beachvolley Ex Metabol',
  'ubicacion': 'https://maps.app.goo.gl/EgPsXQpSf4Jv2txGA'},
 {'nombre': 'Cancha frontón Ex Metabol',
  'ubicacion': 'https://maps.app.goo.gl/awoN8VsK8k1tTZsMA'},
 {'nombre': 'Asociación de ajedrez',
  'ubicacion': 'https://maps.app.goo.gl/ss46w3GJCsboCehq8'},
 {'nombre': 'Ruta ciclismo', 'ubicacion': ''},
 {'nombre': 'Wally Huatari',
  'ubicacion': 'https://maps.app.goo.gl/dmPTbtFpz3VNEspQ9'},
 {'nombre': 'Wally Beast sport',
  'ubicacion': 'https://maps.app.goo.gl/7sDa17LqMhnzo2kRA'},
 {'nombre': 'National Tennis club ',
  'ubicacion': 'https://maps.app.goo.gl/J3zhuNUBV7JDsFcNA'},
 {'nombre': 'Oruro tennis club',
  'ubicacion': 'https://maps.app.goo.gl/TbCeACsft4ig8iVd8'}];


  @override
  Widget build(BuildContext context) {

Future<DateTime?> showDateTimePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  initialDate ??= DateTime.now();
  firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
  lastDate ??= firstDate.add(const Duration(days: 365 * 200));

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );

  if (selectedDate == null) return null;

  if (!context.mounted) return selectedDate;

  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(initialDate),
  );

  return selectedTime == null
    ? selectedDate
    : DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
}


  const textStyle = TextStyle(
      color: Color.fromARGB(200, 0, 0, 0),
      fontSize: 16.5,
      fontWeight: FontWeight.w500
    );
    return Scaffold(
      backgroundColor: const Color(0xff000643),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                onSaved: (value){ titulo = value; },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white), 
                    ),
                  hintText: 'Titulo Partido',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un titulo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25,),
              // DISCIPLINA
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedDisciplina,
                    hint: const Text(
                      'Disciplina',
                      style: TextStyle(
                        color: Color.fromARGB(200, 0, 0, 0),
                        fontSize: 17
                      ),
                    ),
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDisciplina = newValue;
                      });
                    },
                    items: _disciplina.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // MODALIDAD
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedModalidad,
                    hint: const Text(
                      'Modalidad',
                      style: TextStyle(
                        color: Color.fromARGB(200, 0, 0, 0),
                        fontSize: 17
                      ),
                    ),
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedModalidad = newValue;
                      });
                    },
                    items: _modalidad.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // CATEGORIA
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedCategoria,
                    hint: const Text(
                      'Categoria',
                      style: TextStyle(
                        color: Color.fromARGB(200, 0, 0, 0),
                        fontSize: 17
                        ),
                    ),
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategoria = newValue;
                      });
                    },
                    items: _categorias.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // CANCHAS
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Map<String, String>>(
                    value: _selectedCancha,
                    hint: const Text(
                      'Selecciona una cancha',
                      style: TextStyle(
                        color: Color.fromARGB(200, 0, 0, 0),
                        fontSize: 17
                        ),
                    ),
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (Map<String, String>? newValue) {
                      setState(() {
                        _selectedCancha = newValue;
                      });
                    },
                    items: canchas.map((cancha) {
                      return DropdownMenuItem(
                        value: cancha,
                        child: Text(cancha['nombre']!),
                      );
                    } ).toList() , 
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // FECHA Y HORA
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: ElevatedButton(
                  onPressed: () async {
                    _selectedDate = await showDateTimePicker(context: context);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 50),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (_selectedDate == null) ...[
                        const Text('Seleccionar fecha y hora',
                          style: textStyle,
                        )
                      ] else...[
                        Text(_selectedDate.toString().substring(0, 19),
                          style: textStyle,
                        ),
                      ]
                    ],
                  ), 
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      _formKey.currentState!.save();
                    try {
                      int firstSpaceIndex = _selectedCategoria!.indexOf(' ');
                      // Añadir partido supabase
                      await Supabase.instance.client
                      .from('partidos')
                      .insert([{
                          'partido': titulo, 
                          'disciplina': _selectedDisciplina,
                          'modalidad': _selectedModalidad,
                          'categoria': _selectedCategoria!.substring(firstSpaceIndex + 1), 
                          // 'resultado': _selectedResultado, 
                          'fecha': _selectedDate.toString().substring(0, 10), 
                          'hora': _selectedDate.toString().substring(11, 19),  
                          'date': _selectedDate.toString(),
                          'cancha': _selectedCancha!['nombre'],
                          'ubicacion': _selectedCancha!['ubicacion']
                        }]);
                        // Mostrar dialogo de alerta
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            icon: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                            title: Text('Partido añadido'),
                          );
                        }
                      );
                      // Handle data here
                    } catch (e) {
                      // Handle the error here
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            icon: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 30.0,
                                ),
                            title: Text('Error al añadir partido: $e'),
                          );
                        }
                      );
                      print('Error fetching data: $e');                      
                    }
                    }
                  },
                  child: const Text(
                    'Entrar',
                  style: TextStyle(
                    color: Color(0xff000643)
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}