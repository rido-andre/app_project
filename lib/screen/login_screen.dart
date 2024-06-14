import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/screen/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

 @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
    final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter your username and password')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    const url =
        'https://presensi.spilme.id/login'; // Replace with your server address
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final token = responseBody['token'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt', token);

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => DashboardScreen()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  late String token;
  late String name;
  late String dept;
  late String imgUrl;

  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt')?? "";
    String? name = prefs.getString('name')?? "";
    String? dept = prefs.getString('dept')?? "";
    String? imgUrl = prefs.getString('imgProfil')?? "not found";

    setState(() {
      this.token = token;
      this.name = name;
      this.dept = dept;
      this.imgUrl = imgUrl;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 80,),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  //Logo aplikasi
                 
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text:'Login Admin',
                      style: GoogleFonts.manrope(
                        fontSize: 32,
                        color: const Color(0xFF101317),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    'Halo, silahkan masuk untuk melanjutkan',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      color: const Color(0xFFACAFB5),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const TextField(
                     decoration: InputDecoration(
                      labelText: 'Username',
                      filled: true,
    fillColor: Color.fromARGB(255, 255, 255, 255),
                      enabledBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xFF12A3DA)),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xFF12A3DA)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  // Password TextField
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
    fillColor: Color.fromARGB(255, 255, 255, 255),
                      enabledBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xFF12A3DA)),
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Color(0xFF12A3DA)),
                      ),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 8),
                  //forgot password
//forgot password
GestureDetector(
  onTap: (){
    // Panggil fungsi ketika tombol "Lupa Password?" diklik_forgotPasswordClicked(context);
  },
  child: Align(
    alignment: Alignment.centerRight,
    
    child: Text(
      'Lupa Password?',
      style: GoogleFonts.manrope(
        fontSize: 14,
        color: Color.fromARGB(255, 128, 123, 131),
      ),
    ),
  ),
),
                  const SizedBox(height: 100),
                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      // Login Tap
                      Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                        ),
                        (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50), // width and height
                      backgroundColor: const Color(0xFF12A3DA),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.manrope(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  // Register New Account
                  GestureDetector(
                    onTap: () {
                      // Register Tap
                    },
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          color: const Color(0xFF101317),
                        ),

                      ),
                    ),
                    
                  ),
                  ],
                  
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

