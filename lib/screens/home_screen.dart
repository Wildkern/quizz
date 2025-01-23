import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For fancy fonts
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background for the home screen
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blue, Colors.cyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(seconds: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Fancy animated text using Google Fonts
                AnimatedDefaultTextStyle(
                  style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  duration: const Duration(seconds: 2),
                  child: const Text('Welcome to the Quiz App'),
                ),
                const SizedBox(height: 30),
                // Button with animation and fancy design
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.white.withOpacity(0.7), // Light button color
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: const BorderSide(color: Colors.white, width: 2),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizScreen()),
                    );
                  },
                  child: const Text(
                    'Start Quiz',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Optional: A small bouncing effect at the bottom
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: AnimatedBuilder(
                    animation: Listenable.merge([
                      Listenable.merge([Listenable.merge([])])
                    ]),
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, 10.0),
                        child: child,
                      );
                    },
                    child: const Icon(
                      Icons.arrow_downward,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
