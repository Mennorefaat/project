import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/ui/facebook/loginpage.dart';

class ForgetPassword extends StatefulWidget{
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [

          ui(),
          ],
        ),
      ),
    );
  }
  Widget ui() {
   return  Padding(
     padding: const EdgeInsets.all(16),
     child: Form(
       key: formkey,
       child: Column(
           children: [
             Image.network('https://www.bosch-ebike.com/fileadmin/_processed_/4/4/csm_Bosch-eBike-Text-Bild-icon-Lock-closed_09ebb70625.jpg?_=1647612134',fit: BoxFit.cover,
               height: 300,
               width: double.infinity,),

             const SizedBox(height: 10),
             const Text(
               "Forgot Password",
               style: TextStyle(
                 fontSize: 35,
                 fontWeight: FontWeight.bold,
                 color: Colors.blue,
               ),
             ),
             const SizedBox(height: 10),
             const Text(
                 'Please enter your email address to recover your password.',
                 style: TextStyle(
                   fontSize: 15,
                   color: Colors.black,
                 ),),
             const SizedBox(height:10),
             TextFormField(
               controller: emailController,
               textInputAction: TextInputAction.next,
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Empty email';
                 }
                 return null;
               },
               keyboardType: TextInputType.emailAddress,
               decoration: const InputDecoration(
                 labelText: 'Email',
                 border: OutlineInputBorder(),
                 prefixIcon: Icon(Icons.email,color: Colors.blue,),
               ),
             ),
             const SizedBox(height: 10),
             SizedBox(
               width: double.infinity,
               child: OutlinedButton(
                 onPressed: () {
                   resetPassword();
                 },

                 child: const Text ('Reset Password'),
               ),
             ),
             const SizedBox(height: 10),
             SizedBox(
               width: 200,
               child: OutlinedButton(
                 style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                 onPressed: () => back(),
                 child: const Text ('Go back'),
               ),
             ),
           ]
       ),
     ),
   );
  }
  void displayToast(String message){
    Fluttertoast.cancel();
    Fluttertoast.showToast(

        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  back() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context)=>const Login()),
    );
  }

 void resetPassword() async {
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context)=> const Center(child:  CircularProgressIndicator(),));
    
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Fluttertoast.showToast(msg: 'Password Reset Email Sent! .');

      Navigator.of(context).popUntil((route) => route.isFirst);
    }on FirebaseAuthException catch(e){
      print(e);
      Fluttertoast.showToast(msg:e.message.toString());
      Navigator.of(context).pop();
    }
 }

}