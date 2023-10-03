class Book{
  String name="";
  String description="";
  String id="";
  String numberOfPages="";


  Book( { required this. name,
    required this. description,
    required this. id,
    required this. numberOfPages,}){
    printData();
  }
  void printData(){
    print("name:$name");
    print('description:$description');
    print('id:$id');
    print('Number Of Pages:$numberOfPages');
  }
}

main(){
  List<Book> books=[];
  Book book1=Book(name: "arabic",description: "This is the description of Book 1",id: "1",numberOfPages: "1");
  books.add(book1 );
  Book book2=Book(name: "math",description:"This is the description of Book 2",id: "2",numberOfPages: "50");
  books.add(book2 );
  Book book3=Book(name: "english",description:"This is the description of Book 3",id: "3",numberOfPages: "100");
  books.add(book3 );
  Book book4=Book(name: "science",description: "This is the description of Book 4",id: "4",numberOfPages: "150");
  books.add(book4 );
  print(books);

}