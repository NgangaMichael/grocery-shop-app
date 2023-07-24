import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(80,160,80,40),
            child: Image.asset('lib/images/avocado.png'),
          ),

          Padding(
            padding: EdgeInsets.all(24.0),
            child: Text('We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Text('Fresh items everyday'),

          Spacer(),

          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context, 
              MaterialPageRoute(
                builder: ((context) {
                  return HomePage();
                }
              )
            )),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
                child: const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text('Gest Started',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
            ),
          ),

          Spacer(),

        ],
      ),
    );
  }
}