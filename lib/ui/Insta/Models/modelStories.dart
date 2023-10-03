class ModelStories{

  String _name='';
  String _image='';

  ModelStories(this._name, this._image);

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}