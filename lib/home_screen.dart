import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'onboarding_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Fonction pour se déconnecter
  Future<void> _signOut(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();

    if (context.mounted) {
      // Retour à l'écran d'accueil principal après déconnexion
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        (route) => false, // Supprime tout l'historique de navigation
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // On récupère l'utilisateur actuellement connecté
    final user = Supabase.instance.client.auth.currentUser;
    // On essaie de récupérer le nom depuis les métadonnées, sinon on affiche l'email
    final displayName =
        user?.userMetadata?['full_name'] ?? user?.email ?? 'Aventurier';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Ventur',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.explore, size: 80, color: Colors.black),
            const SizedBox(height: 20),
            Text(
              'Prêt pour l\'aventure ?',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Bienvenue, $displayName',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
