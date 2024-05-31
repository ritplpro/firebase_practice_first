import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice_first/home_page.dart';
import 'package:firebase_practice_first/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
static const String S_Key="uid";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  var emailController=TextEditingController();

  var passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Enter your Email"),
              ],
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21)
                )
              ),
            ),
            SizedBox(height: 21,),
            Row(
              children: [
                Text("Enter your Password"),
              ],
            ),
            TextField(
              controller: passController,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  )
              ),
            ),
            SizedBox(height: 21,),
            ElevatedButton(onPressed: () async {
              try{
                 await firebaseAuth.signInWithEmailAndPassword(email: emailController.text.toString(),
                    password:passController.text.toString()).then((value)async{

                  var dataUid=value.user!.uid;
                  print("uid is ${dataUid}");
                  var prefs=await SharedPreferences.getInstance();
                  prefs.setString(LoginPage.S_Key,value.user!.uid);
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
                });

              }on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }


            }, child:Text("Login ")),
            SizedBox(height: 21,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don`t have account"),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignupPage()));
                },
                    child:Text("Create act?",style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            )


          ],
        ),
      ),
    );
  }
}
