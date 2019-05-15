class ActiveUserModel {
  int id;
  String name;
  String imagePath;

  ActiveUserModel({this.id, this.name, this.imagePath});

  ActiveUserModel.fromMap(Map m) {
    id = m['id'];
    name = m['name'];
    imagePath = m['image_path'];
  }
}
