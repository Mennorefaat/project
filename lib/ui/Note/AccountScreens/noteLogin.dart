import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/ui/Note/AccountScreens/registerScreen.dart';
import 'package:untitled1/ui/Note/AccountScreens/resetPass.dart';
import 'package:untitled1/ui/Note/Screens/noteScreen.dart';

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
        primarySwatch: Colors.grey,

      ),
      // when click on Run will not go back to the login screen
      home: FirebaseAuth.instance.currentUser==null?
      const NoteLogin():
      const NoteLogin(),
    );
  }
}
class NoteLogin extends StatefulWidget {
  const NoteLogin({super.key});

  @override
  State<NoteLogin> createState() => _NoteLoginState();
}

class _NoteLoginState extends State<NoteLogin> {

  bool obscureText=true;

  final emailController = TextEditingController();
  var passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(child: Expanded(child: loginPage())),

    );}

 Widget loginPage() {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: ()  => forgottenPass(),
                  child:const Align(
                    alignment: Alignment.center,
                    child: Text('Forgotten Password?',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 230,
                child: OutlinedButton.icon(

                  onPressed: () => register(),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.grey,
                  ),
                  label:const Text ('Create New Account',style: TextStyle(color: Colors.black54),),
                  icon:
                  Icon(Icons.navigate_next,color: Colors.black54,),
                ),
              ),

            ],
          ),
        ),
      ),
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
        MaterialPageRoute(builder: (context)=> const NoteScreen()),);
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

