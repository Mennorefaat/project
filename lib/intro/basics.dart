import 'dart:convert';

main() {
//dart program prints the average of 4 int variables.
 int num1 = 10;
 int num2 = 20;
 int num3 = 30;
 int num4 = 40;
 double avg;
 int sum = 4;
 avg = (num1 + num2 + num3 + num4) / sum;
 print(avg);


 //________________
 //dart program compare between 2 variables (using comparison operator) and print the result
 int result;
 print('Result :  ${num1 > num2}');

 //__________________
 //dart project changes degree from Celsius to Fahrenheit
 double celsius = 35;
 double fahrenheit = (celsius * 9 / 5) + 32;
 //double result =fahrenheit;
 print('fahrenheit :$fahrenheit');
 //print('Result :  $result');


 //-------------
 //!
 print(!false);
 print(!true);


 //-----------------
 //&&
 print(10 > 5 && 10 < 20);

 //-----------
 //||
 print(10 > 5 || 10 < 20);

 //------------
 //+=
 int num5 = 5;
 num5 += 10;
 print(num5);

 //------------
 //*=
 int num6 = 5;
 num6 *= 10;
 print(num6);


 List<String> lang = ['arabic', 'english'];
 print(lang);

//-------------------------------------------------------------
//Using Ternary Operator, compare between two integers variables
 print('---------------------------------------------------------');
 int numone = 3;
 int numtwo = 5;
 if (numone > numtwo) {
  print('number one is greater than number two');
 }
 else {
  print('number two is greater than number one');
 }

//-----------------------------------------------------------
//using switch, a dart program to find number of days in a month
 print('---------------------------------------------------------');
 int month = 2;
 switch (month) {
  case 1:
   print('31 days ');
   break;
  case 2:
   int year = 2022;
   if (year % 4 == 0) {
    print('29 days');
   }
   else {
    print('28 days');
   }
   break;
  case 3:
   print('31 days ');
   break;
  case 4:
   print('30 days ');
   break;
  case 5:
   print('31 days ');
   break;
  case 6:
   print('30 days ');
   break;
  case 7:
   print('31 days ');
   break;
  case 8:
   print('31 days ');
   break;
  case 9:
   print('30 days ');
   break;
  case 10:
   print('31 days ');
   break;
  case 11:
   print('30 days ');
   break;
  case 12:
   print('31 days ');
   break;
  default:
   print('error');
 }

 //-----------------------------------------------------
 //Using if, dart program prints whether the variable is even or odd
 print('---------------------------------------------------------');
 int num = 2;
 if (num % 2 == 0) {
  print('whether is even number');
 }
 else {
  print('whether is odd number');
 }

 int numthree = 10;
 int numTwo = 20;

 print(numthree + numTwo);




 int grade = 85;


 switch (grade) {
  case >= 85:
   {
    print("A");
   }
   break;
  case >= 75:
   {
    print("B");
   }
   break;
  case >= 65:
   {
    print("c");
   }
   break;
  case >= 50:
   {
    print("D");
   }
   break;
  default:
   {
    print("F");
   }
 }

 String status = "cancelled";


 switch(status){
  case == "Cancelled":
   {
    print("order cancelled");
   }
   break;
  case == "accepted":
   {
    print("order accepted");
   }
   break;

 }
//using dart remove spaces in this string " Ah med"
 String name="Ah med";
print(name.replaceAll(" ","")) ;

//--------------------------
//using dart capitalize this string "hello".
 print('-----------------------------------');
 String welcome="hello";
 print(welcome.toUpperCase());

//-------------------------------------
//using dart reverse this word "Hello".
 print('------------------------------------');
 List<String> welcome2=['Hello'];
 welcome2=welcome2.reversed.toList();
 print(welcome2);

 //-------------------------------------
//using dart revers this word "madam" and check if it is palindrome or not.
 print('------------------------------------');
 //List<String> word=['madam'];
// word=word.reversed.toList();
 //if(word.toLowerCase()){
 String word = "madam";
 String reversedWord = word.split('').reversed.join();

 if (word.toLowerCase() == reversedWord.toLowerCase()) {
  print("$word is a palindrome.");
 } else {
  print("$word is not a palindrome.");
 }

 //-------------------------------------
 print('------------------------------------');
 List<String> names = [ "Moaz", "Ahmed", "Mohamed"];
 //print index 2.
 print(names[2]);
 // remove index 1.
 names.removeAt(1);
 // revers list and print it.
 print(names=names.reversed.toList());
 // add to the list "Ali".
 names.add("Ali");
 print(names);

 //-----------------------
 // using loops print all even numbers from 1 to 10
 for(int number=2;number<=10;number+=2) {
  print(number);
 }
//----------------------------------------------------------
//Define a variable originalNumber as a double with the value 7.8.
// Then, perform the following conversions:
 print('-------------------------------------------------------');
 double originalNumber =7.8;
 // 1) Convert originalNumber to an integer and store it in a variable called integerNumber.
 int integerNumber = originalNumber.toInt();
 print(integerNumber);

 // 2) Convert originalNumber to a string and store it in a variable called stringNumber.
 String stringNumber = originalNumber.toString();
 print(stringNumber);


 }








