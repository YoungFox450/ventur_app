import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  final bool curveTopLeft;

  const BackgroundWrapper({
    super.key,
    required this.child,
    this.curveTopLeft = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1516466723877-e4ec1d736c8a?q=80&w=1000&auto=format&fit=crop',
              fit: BoxFit.cover,
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.65,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(curveTopLeft ? 80 : 0),
                  topRight: Radius.circular(curveTopLeft ? 0 : 80),
                ),
              ),

              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
