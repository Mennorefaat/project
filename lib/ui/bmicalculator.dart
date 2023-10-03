
import 'package:flutter/material.dart';
import 'package:untitled1/colors/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,

      ),
      home: const UI(),
    );
  }
}
class UI extends StatefulWidget {
  const UI({super.key});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  int number1=0;
  int number2=0;

  double _value =100;
  bool male =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: const Text('BMI CALCULATOR',style: TextStyle(color: Colors.white),),
        centerTitle: true,

      ),
      body:
          Container(
            color: mainColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,

              children: [
                //Expanded(
                  //child: ListView(
                    //scrollDirection: Axis.vertical,
                   // children:<Widget>[
                    Expanded(
                     child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                male=true;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: male ? selectedColor: secondColor,
                                borderRadius: BorderRadiusDirectional.circular(10),
                              ),
                              child: const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.male_outlined,color: Colors.white,size: 100,),
                                    Text('MALE',style: TextStyle(color: Colors.grey,fontSize:20),),
                                  ],
                                ),
                              ),

                            ),
                          ),
                        ),

                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                male=false;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color:male ? secondColor: selectedColor,
                                borderRadius: BorderRadiusDirectional.circular(10),
                              ),
                              child: const Expanded(
                                child: Column(
                                  children: [
                                    Icon(Icons.female_outlined,color: Colors.white,size:100,),
                                    Text('FEMALE',style: TextStyle(color: Colors.grey,fontSize: 20),),
                                  ],
                                ),
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                        color: secondColor,
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),

                      child:  Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('HEIGHT',style: TextStyle(color: Colors.grey,fontSize: 20),),
                           /*Text(
                              "${_value.toInt()}  ",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 66,

                              ),),*/
                             Expanded(
                               child: RichText(text: TextSpan(

                          children: [
                            TextSpan(
                                text: _value.toStringAsFixed(1),
                                style: const TextStyle(fontSize: 66,fontWeight: FontWeight.bold), // Adjust the font size as needed
                                ),
                          const TextSpan(
                                text: ' cm',
                                style: TextStyle(fontSize: 20), // Adjust the font size as needed
                                ),
                          ],
                          ),
                               ),
                             ),
                            Expanded(
                              child: SizedBox(
                                child: Slider(
                                  activeColor: pinkColor,
                                  thumbColor: pinkColor,
                                  inactiveColor: Colors.white,
                                  min: 100,
                                  max: 200.00,
                                  value: _value ,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                    });

                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: secondColor,
                              borderRadius: BorderRadiusDirectional.circular(10),
                            ),
                            child:Expanded(
                              child: Column(
                                children: [
                                  const Text('WEIGHT',style: TextStyle(color: Colors.grey,fontSize: 20),),
                                  Text(
                                    number1.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 66,
                                    ),

                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FloatingActionButton(onPressed: (){
                                          if (number1==0){
                                            return;
                                          }
                                          number1--;
                                          setState(() {});
                                        },
                                          child: const Icon(Icons.remove,color: Colors.white,),
                                        ),
                                        FloatingActionButton(onPressed: (){
                                          number1++;
                                          setState(() {});
                                        },
                                          child: const Icon(Icons.add,color: Colors.white,),
                                        ),

                                      ],

                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: secondColor,
                              borderRadius: BorderRadiusDirectional.circular(10),
                            ),
                            child:Expanded(
                              child: Column(
                                children: [
                                  const Text('AGE',style: TextStyle(color: Colors.grey,fontSize: 20),),
                                  Text(
                                    number2.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 66,
                                    ),

                                  ),
                                  Expanded(

                                    child: Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FloatingActionButton(onPressed: (){
                                          if (number2==0){
                                            return;
                                          }
                                          number2--;
                                          setState(() {});
                                        },
                                          child: const Icon(Icons.remove,color: Colors.white,),
                                        ),
                                        FloatingActionButton(onPressed: (){
                                          number2++;
                                          setState(() {

                                          });
                                        },
                                          child: const Icon(Icons.add,color: Colors.white,),
                                        ),

                                      ],

                                    ),
                                  ),
                                ],

                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),

                  Container(
                      decoration: const BoxDecoration(
                        borderRadius:BorderRadiusDirectional.only(bottomEnd: Radius.elliptical(30, 30),bottomStart: Radius.elliptical(30, 30)) ,
                        color: pinkColor,
                      ),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: OutlinedButton(onPressed: (){
                        double result = number1 * _value / number2;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  BmiResult(result: result.toInt())),);
                      }, child: const Text('CALCULATE',style: TextStyle(color: Colors.white,fontSize: 30),
                      ),
                      ),
                  ),
              ]

            ),
                ),
         //], //),


      //),
    );
  }
}
class BmiResult extends StatelessWidget {

  final int result;

  const BmiResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: mainColor,
              child: Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   mainAxisSize: MainAxisSize.max,

                    children: [
                      const Text('Your Result',style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white
                      ),),
                      Container(
                      ),

                      Expanded(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: selectedColor,
                            borderRadius: BorderRadiusDirectional.circular(10),
                          ),
                          child:  Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Normal',style: TextStyle(color: Colors.green,fontSize:30,fontWeight: FontWeight.bold),),


                                Text(
                                  result.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 66,
                                  ),

                                ),
                                const Text('Nice',style: TextStyle(color: Colors.white,fontSize:30),
                                ),
                              ],
                            ),
                          ),

                        ),
                      ),
                      SizedBox(
                        child: Container(
                         color: pinkColor,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          width: double.infinity,
                          child: OutlinedButton(onPressed: (){
                            Navigator.pop(context, MaterialPageRoute(builder: (context)=> const UI()),);
                          }, child: const Text('Re-CALCULATE',style: TextStyle(color: Colors.white,fontSize: 30),
                          ),
                          ),
                        ),
                      ),
                ]
    ),
              ),
            ))
    );
  }
}

