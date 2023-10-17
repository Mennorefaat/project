class ModelStories{

  String _name='';
  String _image='';
  bool _shown;


  ModelStories(this._name, this._image, this._shown);

  bool get shown => _shown;

  set shown(bool value) {
    _shown = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}