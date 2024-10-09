import 'package:flutter/material.dart';
// import 'package:juegos_arq/screens/ganadores/addGanadorForm.dart';
import 'package:juegos_arq/shared/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
  url: 'https://hmkiagekhcwvizptxyzu.supabase.co'
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhta2lhZ2VraGN3dml6cHR4eXp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEzMTU4MDUsImV4cCI6MjAzNjg5MTgwNX0._8NpdgOIWwtuzxuQbFQdNoN-hsXqa7uDWT1-rlyaJD4',
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
