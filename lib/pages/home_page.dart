import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hack/firebase/auth.dart';
import 'package:hack/harsh/lib/screen/home/home_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  AuthServices().signOut();
                },
                child: Text("Sign Out"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2()));
                },
                child: Text("Marketplace"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
