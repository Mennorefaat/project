import 'package:firebase_auth/firebase_auth.dart';

class Note{
  String _id='';
  String _userId='';
  String _title='';
  String _content='';

  Note(this._content,this._title,this._id,);

  Note.fromMap(Map<String,dynamic> data){
    _id =data ['id'];
    _userId =data ['userId'];
    _title =data ['title'];
    _content =data ['content'];
  }
  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      //get userId from firebase bta3 al user elly 3ml login
      'userId':FirebaseAuth.instance.currentUser!.uid,
      'title':title,
      'content':content,
    };
  }
}
