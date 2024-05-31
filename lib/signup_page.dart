import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice_first/modal/signin_modal.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {

  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  FirebaseFirestore firestore=FirebaseFirestore.instance;




  var emailcontroller=TextEditingController();
  var passcontroller=TextEditingController();
  var namecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Enter your Name"),
              ],
            ),
            TextField(
              controller: namecontroller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_box),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                  )
              ),
            ),
            SizedBox(height: 21,),
            Row(
              children: [
                Text("Email Address"),
              ],
            ),
            TextField(
              controller: emailcontroller,
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
                Text("Password"),
              ],
            ),
            TextField(
              controller:passcontroller,
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
                var cred=await firebaseAuth.createUserWithEmailAndPassword(email: emailcontroller.text.toString(),
                    password:passcontroller.text.toString());
                print("UID${cred.user!.uid}");
                var newuser=SigninModal(name: namecontroller.text.toString());
                
               firestore.collection("user").doc(cred.user!.uid).set(newuser.todoc());
                  Navigator.pop(context);


              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
              } catch (e) {
                print(e);
              }



            }, child:Text("Login ")),
            SizedBox(height: 21,),



          ],
        ),
      ),
    );
  }
}
