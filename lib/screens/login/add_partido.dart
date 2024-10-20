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
  String? _selectedResultado;
  DateTime? _selectedDate;
  String? titulo;
  String? resultado;

  final List<String> _disciplina = ['FUTBOL', 'BALL', 'VOLEIBOL', 'WALLY', 'TENIS', 'AJEDREZ', 'ATLETISMO', 'TRIATLON', 'NATACION', 'CICLISMO'];
  final List<String> _modalidad = ['VARONES', 'DAMAS', 'MIXTO', 'DOBLES', 'INDIVIDUAL', 'FUTBOL 8 VARONES', 'FUTBOL SALA VARONES', 'WALLY VARONES'];
  final List<String> _categorias = ['MASTER', 'MASTER ORO', 'LIBRE', 'SENIOR'];
  final List<String> _resultado = ['SI', 'NO'];

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
              SizedBox(height: 25),
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
              SizedBox(height: 25),
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
                      // 'Seleccionar fecha y hora', 
                      // style: TextStyle(
                      //   color: Color.fromARGB(200, 0, 0, 0),
                      //   fontSize: 16.5,
                      //   fontWeight: FontWeight.w500
                      // ),
                  ), 
                ),
              ),
              // TextFormField(
              //   onSaved: (value){ fecha = value; },
              //   decoration: const InputDecoration(
              //     hintText: '2024-10-20',
              //     filled: true,
              //     fillColor: Colors.white,
              //   ),
              //   validator: (String? value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Por favor ingrese la fecha';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   onSaved: (value){ },
              //   decoration: const InputDecoration(
              //     hintText: '16:00:00',
              //     filled: true,
              //     fillColor: Colors.white,
              //   ),
              //   validator: (String? value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Por favor ingrese la hora';
              //     }
              //     return null;
              //   },
              // ),
              const SizedBox(height: 25),
              TextFormField(
                onSaved: (value){ resultado = value; },
                decoration: const InputDecoration(
                  hintText: 'Ubicacion',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la Ubicacion';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      _formKey.currentState!.save();
                      // _selectedDate!.toString().substring(0, 4);
                      // print('${_selectedDate.toString().substring(0,4)} $titulo $_selectedDisciplina $_selectedModalidad $_selectedCategoria');

                    // Navigator.push( context,
                    // MaterialPageRoute(
                    //     builder: (context) => const MenuLogin()));
                    try {
                      // Añadir partido supabase
                      await Supabase.instance.client
                      .from('partidos')
                      .insert([{
                        'partido': titulo, 
                        'disciplina': _selectedDisciplina,
                        'modalidad': _selectedModalidad,
                        'categoria': _selectedCategoria, 
                        // 'resultado': _selectedResultado, 
                        'fecha': _selectedDate.toString().substring(0, 10), 
                        'hora': _selectedDate.toString().substring(11, 19),  
                        'cancha': 'cancha'
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
                        print('$titulo $resultado' '$_selectedResultado' '$_selectedCategoria');
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