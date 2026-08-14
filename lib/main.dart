import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// Fonction asynchrone pour initialiser les services avant le lancement
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Supabase avec tes identifiants
  await Supabase.initialize(
    url: 'https://tuxiplbnnccarndncwum.supabase.co/rest/v1/',
    anonKey: 'sb_publishable_KEF2QCdc2W5hZ_2q-i2ppw_fBug7IuL',
  );

  runApp(const VenturApp());
}

class VenturApp extends StatelessWidget {
  const VenturApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ventür',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Application d'une police élégante similaire à la maquette
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      // Nous définirons cet écran à la prochaine étape
      home: const Scaffold(
        body: Center(child: Text('Préparation de l\'UI...')),
      ),
    );
  }
}