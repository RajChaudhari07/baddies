import 'package:flutter/material.dart';
class AdminPage extends StatelessWidget {
  final String email;
   const AdminPage({super.key, required this.email});
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome Admin',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 7,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox (height: 15),
              ElevatedButton(
                onPressed: (){
                  print("Group Created");
                },
                child:const Text('Create Group'),
              ),
              ElevatedButton(
                onPressed: (){
                  print("Managing the Users");
                },
                child: const Text('Manage users'),
              ),
              ElevatedButton(
                onPressed: (){
                  print("Viewing payment dashboard");
                }, 
                child: const Text('View Paaymnet dashboard'),
                ),
              ElevatedButton(
                onPressed: (){
                  print("Master Code Generated");
                },
                child:const Text('Generate Master Code'),
            )
          ],
        ),
      ),
    );
  }
}