class PostModel{

  String profilePic='';
  String postPic='';
  String name='';
  String captions='';
  bool isOnline;

  PostModel({
    required this.isOnline,
  required this.profilePic,
  required this.postPic,
  required this.name,
    required this.captions,
});
}