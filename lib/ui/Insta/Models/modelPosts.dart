 class ModelPosts{

  String _name1='';
  String _image1='';
  String _name2='';
  String _image2='';
  String _image3='';
  String _image4='';
  String _image5='';


  ModelPosts(this._name1, this._image1, this._name2, this._image2,this._image3,this._image4,this._image5);

  String get image2 => _image2;

  set image2(String value) {
    _image2 = value;
  }

  String get name2 => _name2;

  set name2(String value) {
    _name2 = value;
  }

  String get image1 => _image1;

  set image1(String value) {
    _image1 = value;
  }

  String get name1 => _name1;

  set name1(String value) {
    _name1 = value;
  }

  String get image3 => _image3;

  set image3(String value) {
    _image3 = value;
  }

  String get image5 => _image5;

  set image5(String value) {
    _image5 = value;
  }

  String get image4 => _image4;

  set image4(String value) {
    _image4 = value;
  }
}