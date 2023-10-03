
import 'package:flutter/material.dart';

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
      home: const Login(),
    );
  }
}




//forget password text navigates to forget password screen
// - forget password screen navigates to reset password screen
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: Colors.black,),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                  prefixIcon: Icon(Icons.lock, color: Colors.black,),

                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),

                onPressed: () => navToForgetPassword(context),
                child:const Align(
                  alignment: Alignment.topRight,
                  child: Text('Forget password', style: TextStyle(color: Colors.black,),),
                ),
              ),
                 Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex:2,
                          child: SizedBox(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                              onPressed: () {},
                              child: const Text ('Login'),
                            ),
                          ),

                        ),

                      const SizedBox(height: 10),
                      Expanded(
                        child: SizedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                            onPressed: () {},
                            child: const Text ('Register'),
                          ),
                        ),
                      ),
                    ],
                  ),
            ]
        ),
      ),
    );
  }


  navToForgetPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgetPassword()),
    );
  }
}


class ForgetPassword extends StatelessWidget{
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Forget Password', style: TextStyle(color: Colors.white)),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            children: [
        const SizedBox(height: 200),
        TextFormField(
           textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email,color: Colors.black,),
          ),
          ),
         const SizedBox(height: 10),
         SizedBox(
           width: double.infinity,
           child: ElevatedButton(
             style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
               onPressed: () => navToForgetPassword2(context),
               child: const Text ('Sent OTP'),
        ),
      ),
    ]
    ),
    ),
    );
  }

  navToForgetPassword2(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>const ResetPassword()),
    );
  }
}
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            children: [
              const SizedBox(height: 200),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'OTP',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.code, color: Colors.black,),
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
                  suffixIcon: Icon(Icons.visibility),
                  prefixIcon: Icon(Icons.lock, color: Colors.black,),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                  prefixIcon: Icon(Icons.lock, color: Colors.black,),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  onPressed: () {},
                  child: const Text ('Reset Password'),
                ),
              ),
            ]
        ),
      ),
    );
  }
}

