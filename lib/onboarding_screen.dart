import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'background_wrapper.dart'; // N'oublie pas d'importer le widget que nous avons créé
import 'signin_screen.dart';
import 'signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      // On veut la courbe en haut à droite comme sur le premier téléphone
      curveTopLeft: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        // La colonne prend juste la place nécessaire
        children: [
          // Titre principal
          Text(
            'Découvrez.',
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),

          // Sous-titre
          Text(
            'Découvrez des aventures locales ajoutées et\nentretenues par des utilisateurs comme vous.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),

          // Bouton "Sign up" (Noir)
          SizedBox(
            width: double.infinity, // Le bouton prend toute la largeur
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                // Navigation vers la page d'inscription
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ), // Bouton très arrondi
                ),
              ),
              child: const Text(
                'S\'inscrire',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // Lien "Already a member yet? Sign in"
          Center(
            child: GestureDetector(
              onTap: () {
                // Navigation vers la page de connexion
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: 'Déjà membre ? \n',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'Se connecter',
                      style: TextStyle(
                        color: Colors.blue[700],
                        // Une couleur bleutée pour le lien
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
