import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddGame extends StatefulWidget {
  const AddGame({super.key});

  @override
  State<AddGame> createState() => _AddGameState();
}

class _AddGameState extends State<AddGame> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedCategoria;
  String? _selectedResultado;
  final List<String> _categorias = ['MASTER', 'MASTER ORO', 'LIBRE', 'SENIOR'];
  final List<String> _resultado = ['SI', 'NO'];

  @override
  Widget build(BuildContext context) {
    String? titulo;
    String? resultado;
    String? fecha;
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
              SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedResultado,
                    hint: const Text(
                      'Resultado',
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
                        _selectedResultado = newValue;
                      });
                    },
                    items: _resultado.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              TextFormField(
                onSaved: (value){ fecha = value; },
                decoration: const InputDecoration(
                  hintText: '2024-10-20',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el resultado';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                onSaved: (value){ },
                decoration: const InputDecoration(
                  hintText: '16:00:00',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la hora';
                  }
                  return null;
                },
              ),
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
                    // Navigator.push( context,
                    // MaterialPageRoute(
                    //     builder: (context) => const MenuLogin()));
                    try {
                      // Añadir partido supabase
                      await Supabase.instance.client
                      .from('partidos')
                      .insert([{
                        'partido': titulo, 
                        'categoria_test': _selectedCategoria, 
                        'resultado': _selectedResultado, 
                        'fecha': fecha, 
                        'hora': '16:00:00', 
                        'id_cancha': 1 
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