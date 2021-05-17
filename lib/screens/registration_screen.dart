import 'package:flutter/material.dart';
import 'package:myapp/components/rounded_button.dart';
import 'package:myapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email=value;
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              // style: TextStyle(
              //   color: Colors.black87,
              // ),
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                password=value;
              },
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              btnText: 'Register',
              btnColor: Colors.blueAccent,
              onPressed: () async {
                // print(email);
                // print(password);
                try{
                  final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(newUser!=null)
                    Navigator.pushNamed(context, ChatScreen.id);
                }catch(e){
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
