import 'dart:async'; // Ajoute cet import pour le StreamSubscription
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'aut_gate.dart';
import 'update_password_screen.dart'; // Ajoute l'import de la nouvelle page

// Fonction asynchrone pour initialiser les services avant le lancement
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Supabase avec tes identifiants
  await Supabase.initialize(
    url: 'https://tuxiplbnnccarndncwum.supabase.co',
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR1eGlwbGJubmNjYXJuZG5jd3VtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODY2NTkyMDEsImV4cCI6MjEwMjIzNTIwMX0.M9RfUB4tkXLr_crTXV9xfXETZcadrvvdZ3WH-EomzWg",
  );

  runApp(const VenturApp());
}

class VenturApp extends StatefulWidget {
  const VenturApp({super.key});

  @override
  State<VenturApp> createState() => _VenturAppState();
}

class _VenturAppState extends State<VenturApp> {
  // Clé globale du navigateur pour pouvoir déclencher un changement d'écran
  // depuis le point d'entrée de l'app, avant même que l'interface ne soit totalement dessinée.
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final StreamSubscription<AuthState> _authSubscription;

  @override
  void initState() {
    super.initState();

    // On écoute les changements d'état de l'authentification Supabase
    _authSubscription =
        Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;

      // Si l'événement est une récupération de mot de passe (clic sur le lien mail)
      if (event == AuthChangeEvent.passwordRecovery) {
        _navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (context) => const UpdatePasswordScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _authSubscription.cancel(); // Ne pas oublier d'annuler l'écoute à la fermeture
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey, // On attache la clé à notre application
      title: 'Ventür',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Application d'une police élégante similaire à la maquette
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}
