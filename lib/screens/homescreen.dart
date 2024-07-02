import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:midterm_project/screens/login.dart';

class Homescreen extends StatelessWidget{
  const Homescreen ({super.key});


void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedInUser');
    context.go('/');
}


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homescreen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final loggedInUser = snapshot.data?.getString('loggedInUser');
            if (loggedInUser != null) {
              return Center(child: Text("Welcome, $loggedInUser!"));
            } else {
              // If no logged in user, navigate back to login screen
              context.go('/');
              return SizedBox.shrink();
            }
          }
        },
      ),
    );}
}