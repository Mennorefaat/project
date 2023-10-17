import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText=true;
  final emailController =TextEditingController();
  final passController =TextEditingController();
//to stop controller not to continues working in back ground
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle:true ,
        title: const Text('Register Screen', style: TextStyle(color: Colors.white)),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ui(),

          ],
        ),
      ),

    );
  }

  Widget ui(){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(

        children: [
          const SizedBox(height: 100),
          TextFormField(

            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person,color: Colors.black,),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email,color: Colors.black,),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: passController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscureText,
            decoration:  InputDecoration(
              suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      obscureText=!obscureText;
                    });
                  }
                  , icon:Icon(obscureText? Icons.visibility_off:Icons.visibility)),

              labelText: 'Password',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscureText,
            decoration:  InputDecoration(
              suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      obscureText=!obscureText;
                    });
                  }
                  , icon:Icon(obscureText? Icons.visibility_off:Icons.visibility)),

              labelText: 'Current Password',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                String email = emailController.text;
                String pass = passController.text;

                createAccount(email, pass);
              },
              style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
              child: const Text ('Register'),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context, MaterialPageRoute(builder: (context)=> const Login()),),
              style: OutlinedButton.styleFrom(shape: const StadiumBorder()) ,
              child: const Text ('Login'),
            ),
          ),

        ],
      ),
    );
  }
  void createAccount(String email,String password) async{
    //same as the second code
    /*FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      Fluttertoast.showToast(msg:'Account Created!');
      Navigator.pop(context);
    }) .catchError((error){
      Fluttertoast.showToast(msg: error.toString());
    });
*/
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Fluttertoast.showToast(msg:'Account Created!');
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Fluttertoast.showToast(msg: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
