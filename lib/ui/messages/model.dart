class Photos{
  String _image='';

  Photos(this._image);

  String get image => _image;

  set image(String value) {
    _image = value;
  }
}