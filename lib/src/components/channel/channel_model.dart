class ChannelModel {
  int id;
  String name;
  String imagePath;

  ChannelModel({this.id, this.name, this.imagePath});

  ChannelModel.fromMap(Map m) {
    id = m['id'];
    name = m['name'];
    imagePath = m['image_path'];
  }
}
