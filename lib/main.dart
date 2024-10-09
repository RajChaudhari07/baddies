import 'package:baddies/admin_page.dart';
import 'package:baddies/regestration_form.dart';
import 'package:flutter/material.dart';
import 'package:baddies/login_form.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Creation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileCreationForm(),
      debugShowCheckedModeBanner: false,
      routes:{
        '/profile_creation':(context)=>const ProfileCreationForm(),
        '/login': (context)=> const LoginForm(), 
        '/admin':(context)=> const  AdminPage(email: '',),
      }
    );
  }
}