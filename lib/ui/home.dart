import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
         primarySwatch: Colors.green,

       ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _LoginState();
}

class _LoginState extends State<Home> {
  bool obscureText = true;
  final emailController = TextEditingController();
  var passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  final formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Colors.black,),
                  ),
                  validator: (value){
                    if (value!.isEmpty){
                      return'Email Required';
                    }
                    if(!value.contains('@')|| !value.contains('.')){
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  obscureText: obscureText,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      labelText: 'password',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock, color: Colors.black,),
                      suffixIcon: IconButton(
                          onPressed: () {
                            obscureText = !obscureText;
                            setState(() {});
                          },
                          icon: Icon(obscureText ? Icons.visibility_off : Icons
                              .visibility))
                  ),
                  validator: (value){
                    if (value!.isEmpty){
                      return'Password Required';
                    }
                    if(value.length<6){
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            onPressed: () => login(context),
                            child: const Text ('Login'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => navToRegister(context),
                            style: OutlinedButton.styleFrom(
                                shape: const StadiumBorder()),
                            child: const Text ('Register'),
                          ),
                        ),
                      ),
                    ]

                )

              ]
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
    if(email == "menna@gmail.com"&& password =="123"){
      Navigator.pushReplacement(context as BuildContext,
        MaterialPageRoute(builder: (context)=> const Login()),);
    }else{
      print('Email or password wrong');
      displaySnackBar('error',context);
      displayToast('Password or Email wrong');
    }
  }
  void displaySnackBar(String message, BuildContext context){
    final snackBar=SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
}

  navToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  navToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  const Login()),
    );
  }

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: const Text('Home Screen', style: TextStyle(color: Colors.black)),
            
      ),
      body: Column(
        children: [
          Image.network(
            'https://images.pexels.com/photos/14918477/pexels-photo-14918477.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            height:150,
            width:double.infinity ,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/whatsapp.png',
              width: 100,
              height: 100,
            ),
            Image.asset(
              'assets/image/instagram.jpeg',
              width: 100,
              height: 100,
            )
          ],
          )
        ],
      ),
    );
  }
}


class Register extends StatelessWidget{
  const Register({super.key});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      centerTitle:true ,
      title: const Text('Register Screen', style: TextStyle(color: Colors.black)),

      ),
   body: Padding(
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
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          ),
        ),
         const SizedBox(height: 10),
        TextFormField(
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Current Password',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          ),
        ),
     const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
                },
            style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
            child: const Text ('Register'),
              ),
        ),
        const SizedBox(height: 10),
        const Text("Don't have account?"),
        const SizedBox(height: 10),
        SizedBox(
          child: OutlinedButton(
            onPressed: () {
            },
            style: OutlinedButton.styleFrom(shape: const StadiumBorder()) ,
            child: const Text ('Login'),
          ),
        ),
        
        ],
     ),
   ),

    );
}}



