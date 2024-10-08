import 'package:flutter/material.dart';
// import 'package:juegos_arq/screens/ganadores/addGanadorForm.dart';
import 'package:juegos_arq/shared/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
  url: ENV.URL
  anonKey: ENV.ANONKEY
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Juegos Deportivos Nacionales de Arquitectos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      // home: AddGanadorForm(),
    );
  }
}
