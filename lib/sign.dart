import 'package:fire/h.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController pass = TextEditingController();
    Future sign() async {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: pass.text,
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => ing()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  label: Text('Email'), border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: pass,
              decoration: InputDecoration(
                  label: Text('Password'), border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                // email.clear();
                // pass.clear();
                sign();
              },
              child: Text('Log'))
        ],
      ),
    ));
  }
}
