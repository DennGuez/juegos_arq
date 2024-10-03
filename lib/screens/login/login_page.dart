import 'package:flutter/material.dart';
import 'package:juegos_arq/screens/login/menu_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? user;
    String? pass;
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
                onSaved: (value){ user = value; },
                decoration: const InputDecoration(
                  hintText: 'Usuario',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el usuario';
                  }
                  if (value != 'abner') {
                    return 'Usuario o contraseña incorrecto';   
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30,),
              TextFormField(
                onSaved: (value){ pass = value; },
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la contraseña';
                  }
                  if (value != '1601') {
                    return 'Usuario o contraseña incorrecto';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      _formKey.currentState!.save();
                    Navigator.push( context,
                    MaterialPageRoute(
                        builder: (context) => const MenuLogin()));
                      print('$user $pass');
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
