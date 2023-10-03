import 'dart:io';

void main(){
  print(calculateArea(20,10 ));
  printUserData("Menna","refaat",21);

}

//Create a function named "calculateArea" that calculates the area of a rectangle.
// The function should take two parameters: "width" of type double and "height" of type double.
// It should return the calculated area as a double.
double  calculateArea (double width,double height){
  double area = width * height ;
  return area;
}
//Create function named printUserData that takes three parameters:
// firstName (of type String and make it required parameter),
// lastName (of type String and make it optional parameter),
// and age (of type int).
// The function should print out the person's full name along with their age.
void printUserData(String firstName,[String lastName ="No Name",int age=0]){
print("First name:$firstName ,Last name:$lastName");
print("age is $age");
}

