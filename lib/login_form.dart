import 'package:flutter/material.dart';


 class LoginForm extends StatefulWidget{
  const LoginForm({super.key});

  @override
  _LoginFormState createState()=>
  _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email='';
  String password='';

  String? emailFromProfile;
  String? passwordFromProfile;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
      final Map<String, dynamic>
      arguments = 
      ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

      emailFromProfile= arguments['email'];
      passwordFromProfile= arguments['password'];
    }
    Future<void> _login() async {
    if(email == emailFromProfile && password == passwordFromProfile){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar
        (
          content:Text('Login Successfull'),
      ));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar
      (
        content: Text('Invalid username or password'),
      ));
    }
  }
  @override
  Widget build(BuildContext
    context
  )
  {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 89, 143, 145),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Username'
                        ),
                        onSaved: (value){
                          email=value??'';
                        },
                        validator: (value){
                          return value!.isEmpty ? 'Please enter your username' : null;
                        },
                      ),
                      TextFormField(
                        decoration:const InputDecoration(
                          labelText: 'Password'
                        ),
                        obscureText: true,
                        onSaved: (value){
                          password=value??'';
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'please enter your password' : null;
                        },
                      ),
                      const SizedBox(height:15),
                      ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                            _login();
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}