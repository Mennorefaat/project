import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/ui/facebook/facebookpage.dart';
import 'package:untitled1/ui/facebook/registerscreen.dart';
import 'package:untitled1/ui/facebook/resetpassword.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      // when click on Run will not go back to the login screen
      home: FirebaseAuth.instance.currentUser==null?
      const Login():
      const FacebookPage(),
    );
  }
}
class Login extends StatefulWidget {

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool obscureText=true;

  final emailController = TextEditingController();
  var passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(child: loginPage()),

    );}

 Widget loginPage() {
    return Column(
      children: [
        Image.network('https://images.macrumors.com/t/9CE4h8qOTWvPED6L4E8x2jiY5r8=/2250x/article-new/2021/03/Facebook-Feature.jpg',
        fit: BoxFit.cover,
        height: 200,
        width: double.infinity,),
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if (value!.isEmpty){
                      return'please enter your email';
                    }
                    if(!value.contains('@')|| !value.contains('.')){
                      return 'Invalid email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Phone number or email address',
                  ),
                ),
                const SizedBox(height: 10,),
                 TextFormField(
                   obscureText: obscureText,
                 controller: passwordController,
                 textInputAction: TextInputAction.done,
                 keyboardType: TextInputType.visiblePassword,
                 validator: (value){
                  if (value!.isEmpty){
                    return'please enter your password';
                 }
                  if(value.length<6){
                    return 'Invalid password';
                 }
                  return null;
                 },
                 decoration:  InputDecoration(
                   suffixIcon: IconButton(
                       onPressed: (){
                         setState(() {
                           obscureText=!obscureText;
                         });
                       }
                       , icon:Icon(obscureText? Icons.visibility_off:Icons.visibility)),

                   hintText: 'Password',
                 ),
                 ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>login(context),
                    child: const Text ('log in'),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: ()  => forgottenPass(),
                  child:const Align(
                    alignment: Alignment.center,
                    child: Text('Forgotten Password?',
                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                       margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                       child: const Divider(
                       color: Colors.black,
                       height: 50,),
                      ),
                    ),
                    const Text("OR"),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 50,),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 230,
                  child: OutlinedButton(
                    onPressed: () => register(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                        ),
                    child: const Text ('Create New Facebook Account',style: TextStyle(color: Colors.white),),
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
 }
  void login(BuildContext context){
    if (!formKey.currentState!.validate()){
      return;
    }
    String email =emailController.text;
    String password =passwordController.text;
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> const FacebookPage()),);
    }) .catchError((error){
      if (error is FirebaseAuthException){
        if (error.code == 'user-not-found') {
          displayToast('No user found for that email.');
        } else if (error.code == 'wrong-password') {
          displayToast('Wrong password provided for that user.');
        }
      }
      Fluttertoast.showToast(msg: error.toString());
    });
    /*if(email == "menna@gmail.com"&& password =="123456"){
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> const FacebookPage()),);
    }
    */
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
 void register() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen()));
 }

 void forgottenPass() {
   Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgetPassword()));

 }
}

