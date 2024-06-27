import 'package:flutter/material.dart';
import 'package:midterm_project/screens/homescreen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super (key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

   TextEditingController _usernameController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();

   late SharedPreferences _prefs;
   
    String _errorMessage = '';
   @override
   void initState() {
    super.initState();
    _initSharedPreferences();
   }

   Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    await _prefs.setString('username', 'administrator');
    await _prefs.setString('password', '12345');
   }

   void _login()  {
    String inputUsername = _usernameController.text.trim();
    String inputPassword = _passwordController.text.trim();

    String? registeredUser = _prefs.getString('username');
    String? registeredPass = _prefs.getString('password');

    if(inputUsername == registeredUser && inputPassword == registeredPass){
      context.go('/homescreen');
    }
    else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
   }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(  
        color: Colors.white,
      child: Column( 
        children: [
           Image.asset( 
            'assets/images/login.jpg',
            width: 250,
            height: 250,
           ),
           const Center( 
            child: Text(
            "Welcome",
            style: TextStyle(  
              fontSize: 30,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20,),
            const Row(  
              children: [  
                SizedBox(width: 78),
                Text(
                  "Username",
                  style: TextStyle( 
                    fontSize: 10,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(  
              width: 300,
              child: TextField(  
                controller: _usernameController,
                decoration: const InputDecoration(
                // hintText: 'Enter Username',    
                ),
            )
            ),
            const SizedBox(height: 30,),
            const Row(  
              children: [  
                SizedBox(width: 78),
                Text(
                  "Password",
                  style: TextStyle( 
                    fontSize: 10,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(  
              width: 300,
              child: TextField(  
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  // hintText: 'Enter password',
                ),
            ),
            ),
            SizedBox( height: 40,),
            Container(  
              height:30,
              width: 200,

              child: ElevatedButton(  
                onPressed: _login,
                child: const Text(
                  "Login",
                  style: TextStyle(  
                    color: Colors.white,
                  )),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                )
              )
            )
            
        ],
      )  
      )
          
    );
    
  }
}