import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),

              // Illustration
              Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFBDDE1),
                ),
                child: Icon(
                  SolarIconsOutline.password,
                  size: 64,
                  color: Colors.pink,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              SizedBox(height: 12),
              Text(
                'Don\'t worry! Please enter address associated. We\'ll send you reset instructions.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 32, 27, 27),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60),

              // Email Input
              InputField(
                minimumSize: Size(double.infinity, 70),
                icon: SolarIconsOutline.user,
                hintText: 'Email',
              ),
              SizedBox(height: 40),

              // Send Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 70),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  elevation: 4,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/check_email');
                },
                child: Text(
                  'Send',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final IconData icon;
  final String hintText;

  const InputField({
    super.key,
    required this.icon,
    required this.hintText,
    required Size minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
