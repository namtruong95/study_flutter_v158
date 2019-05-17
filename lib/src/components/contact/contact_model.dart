class ContactModel {
  int id;
  String name;
  String imagePath;
  String phone;
  String birthday;

  ContactModel({
    this.id,
    this.name,
    this.imagePath,
    this.phone,
    this.birthday,
  });

  ContactModel.fromMap(Map m) {
    id = m['id'];
    name = m['name'];
    imagePath = m['image_path'];
    phone = m['phone'];
    birthday = m['birthday'];
  }
}
