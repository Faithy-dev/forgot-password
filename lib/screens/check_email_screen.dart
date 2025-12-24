import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              // Back Button
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: Icon(
                      SolarIconsOutline.arrowLeft,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),

              // Email Illustration
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFBDDE1),
                ),
                child: Icon(
                  SolarIconsOutline.letterUnread,
                  size: 64,
                  color: Colors.pink,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Check Your Email',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'We have sent a verification code to your email.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // OTP Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  4,
                  (index) => Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(child: Text('')),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Verify Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 4,
                ),
                onPressed: () {},
                child: Text('Verify'),
              ),
              // Ajoute un espacement plus important entre le bouton et le texte
              const SizedBox(height: 32),

              Text.rich(
                TextSpan(
                  text: "Didn't receive the email? ",
                  style: TextStyle(
                    color:
                        Colors
                            .grey[600], // Un gris moyen pour le texte secondaire
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'Resend(13)',
                      style: const TextStyle(
                        color: Colors.black, // Texte bien noir (dark)
                        fontWeight: FontWeight.bold, // En gras
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
