import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileCreationForm extends StatefulWidget {
  const ProfileCreationForm({super.key});

  @override
  _ProfileCreationFormState createState() => _ProfileCreationFormState();
}

class _ProfileCreationFormState extends State<ProfileCreationForm> {
  final _formKey = GlobalKey<FormState>();

  String registrationId = '';
  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  DateTime? dob;
  String gender = '';
  String city = '';
  String mobileNumber = '';
  String role = 'Select Your Role';
  bool agreeToTerms = false;

  final List<String> genderOptions = ['Male', 'Female'];
  final List<String> roleOptions = ['Select Your Role','Admin', 'User', 'Player'];

  void _submitProfile(){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      Navigator.pushNamed(context,'/login',
      arguments:{
        'email': email,
        'password': password,
      },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      // Setting a background color for the Scaffold
     body: Center(
        child: SingleChildScrollView(
          // Wrapping the form inside a Container with rounded edges and padding
          child: Container(
            padding:  const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 200), // Margin for side spacing
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the form
              borderRadius: BorderRadius.circular(15), // Rounded corners
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20, // Shadow blur
                  offset: Offset(0, 5), // Shadow position
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Centering the title
                const Padding (
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: Text(
                    'Profile Creation',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: -2,
                      letterSpacing: 8,
                      color: Color.fromARGB(255, 185, 164, 105),
                    ),
                  ),
                ),
                // Form starts here
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Registration ID'),
                        onSaved: (value) {
                          registrationId = value ?? '';
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter your Registration ID' : null;
                        },
                      ),
                      TextFormField(
                        decoration:const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          email = value ?? '';
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter your email' : null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        onSaved: (value) {
                          password = value ?? '';
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter your password' : null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'First Name'),
                        onSaved: (value) {
                          firstName = value ?? '';
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter your first name' : null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Last Name'),
                        onSaved: (value) {
                          lastName = value ?? '';
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter your last name' : null;
                        },
                      ),
                      TextFormField(
                        decoration:const InputDecoration(labelText: 'Date of Birth (YYYY-MM-DD)'),
                        keyboardType: TextInputType.datetime,
                        onSaved: (value) {
                          if (value != null && value.isNotEmpty) {
                            dob = DateTime.tryParse(value);
                          }
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your date of birth';
                          } else if (DateTime.tryParse(value) == null) {
                            return 'Please enter a valid date';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           const Text('Gender'),
                            Row(
                              children: genderOptions.map((String value) {
                                return Expanded(
                                  child: RadioListTile<String>(
                                    title: Text(value),
                                    value: value,
                                    groupValue: gender,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        gender = newValue!;
                                      });
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'City'),
                        onSaved: (value) {
                          city = value ?? '';
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'Please enter your city' : null;
                        },
                      ),
                      TextFormField(
                        decoration:const InputDecoration(labelText: 'Mobile Number'),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if(value==null || value.isEmpty){
                            return'Please Enter your Mobile number';
                          }
                          else if (value.length!=10){
                            return 'Mobile number must be 10 digits';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          mobileNumber = value!;
                        },
                      ),
                      DropdownButtonFormField<String>(
                        decoration:const InputDecoration(labelText: 'Role'),
                        value: role,
                        items: roleOptions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            role = newValue!;
                          });
                        },
                        onSaved: (value) {
                          role = value ?? 'User';
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('I agree to the terms and conditions'),
                        value: agreeToTerms,
                        onChanged: (bool? value) {
                          setState(() {
                            agreeToTerms = value ?? false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),

                      ElevatedButton(
                        onPressed: _submitProfile,
                        child: const Text('Submit'),
                      ), 
                    ],
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
