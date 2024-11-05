import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:juegos_arq/shared/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load( fileName: ".env");
  String url = dotenv.env['URL']!;
  String anonKey = dotenv.env['ANON_KEY']!;
  await Supabase.initialize(
    url: url,
    anonKey: anonKey,
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
    );
  }
}
