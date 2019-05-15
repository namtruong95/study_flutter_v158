class MessageModel {
  int id;
  String message;
  bool isCurrentUser;
  String time;
  String userImagePath;

  MessageModel({
    this.id,
    this.message,
    this.isCurrentUser,
    this.time,
    this.userImagePath,
  });

  MessageModel.fromMap(Map m) {
    id = m['id'];
    message = m['message'];
    isCurrentUser = m['is_current'];
    time = m['time'];
    userImagePath = m['user_image_path'];
  }
}
