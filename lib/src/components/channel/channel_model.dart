class ChannelModel {
  String name;
  String imagePath;

  ChannelModel({this.name, this.imagePath});

  ChannelModel.fromMap(Map m) {
    name = m['name'];
    imagePath = m['image_path'];
  }
}
