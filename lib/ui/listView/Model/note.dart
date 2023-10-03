class Note{

  String _title;
  String _content;
  String _image;

  Note(this._content,this._title,this._image);


  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}