import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solar_icons/solar_icons.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top section: logo + texts
              Column(
                children: [
                  SizedBox(height: 80), // push the top section lower
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Welcome, please enter your details',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Middle section: inputs + buttons
              Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: _InputField(
                      iconPath: 'assets/icons/solar/user.svg',
                      hintText: 'Email',
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    child: _InputField(
                      iconPath: 'assets/icons/solar/lock.svg',
                      hintText: 'Password',
                      isPassword: true,
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _rememberMe = !_rememberMe;
                              });
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                                color: _rememberMe ? Colors.pink : Colors.white,
                              ),
                              child:
                                  _rememberMe
                                      ? Icon(
                                        Icons.check,
                                        size: 16,
                                        color: Colors.white,
                                      )
                                      : null,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text('Remember Me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot');
                        },
                        child: Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                      ),
                      icon: Image.asset(
                        'assets/google.png',
                        width: 20,
                        height: 20,
                      ),
                      label: Text('Sign in with Google'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              // Bottom section: Sign Up
              Padding(
                padding: const EdgeInsets.only(bottom: 160),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Sign Up screen
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Input Field Widget with password toggle
class _InputField extends StatefulWidget {
  final String iconPath;
  final String hintText;
  final bool isPassword;
  final Color? backgroundColor;

  const _InputField({
    required this.iconPath,
    required this.hintText,
    this.isPassword = false,
    this.backgroundColor,
  });

  @override
  State<_InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<_InputField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(widget.iconPath, width: 20, height: 20),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
            ),
          ),
          if (widget.isPassword)
            GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText
                    ? SolarIconsOutline.eyeClosed
                    : SolarIconsOutline.eye,
                size: 20,
                color: Colors.grey[700],
              ),
            ),
        ],
      ),
    );
  }
}
