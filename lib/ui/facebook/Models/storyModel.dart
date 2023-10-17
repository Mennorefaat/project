class StoryModel{

  String _otherPic='';
  String _profileName='';
  String _message='';
  bool _isOnline;
  bool _isSeen;
  String _time;
  StoryModel( this._time,this ._isOnline,this._otherPic, this._profileName, this._message,this._isSeen);


  String get time => _time;

  set time(String value) {
    _time = value;
  }

  bool get isSeen => _isSeen;

  set isSeen(bool value) {
    _isSeen = value;
  }

  bool get isOnline => _isOnline;

  set shown(bool value) {
    _isOnline = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  String get profileName => _profileName;

  set profileName(String value) {
    _profileName = value;
  }

  String get otherPic => _otherPic;

  set otherPic(String value) {
    _otherPic = value;
  }


}