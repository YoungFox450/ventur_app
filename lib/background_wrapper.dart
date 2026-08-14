import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  final Widget? imageOverlay;
  final double minHeightFactor;
  final bool curveTopLeft;

  const BackgroundWrapper({
    super.key,
    required this.child,
    this.imageOverlay,
    this.minHeightFactor = 0.55,
    this.curveTopLeft = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1516466723877-e4ec1d736c8a?q=80&w=1000&auto=format&fit=crop',
              fit: BoxFit.cover,
            ),
          ),

          // Logo Ventur
          Positioned(
            top: 60,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ventur',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: -1,
                  ),
                ),
                Text(
                  'l\'aventure continue',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // Slider de texte positionné exactement comme sur l'image
          if (imageOverlay != null)
            Positioned(
              bottom: (MediaQuery.of(context).size.height * minHeightFactor) + 40,
              left: 30,
              right: 30,
              child: imageOverlay!,
            ),

          // Carte blanche avec courbe à droite (Radius 100)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * minHeightFactor,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(curveTopLeft ? 0 : 100),
                  topLeft: Radius.circular(curveTopLeft ? 100 : 0),
                ),
              ),
              padding: const EdgeInsets.only(left: 30, right: 30, top: 45, bottom: 30),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
