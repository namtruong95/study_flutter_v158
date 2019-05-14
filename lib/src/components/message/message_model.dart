class MessageModel {
  int id;
  String message;
  bool isCurrentUser;
  String time;

  MessageModel({this.id, this.message, this.isCurrentUser, this.time});

  MessageModel.fromMap(Map m) {
    id = m['id'];
    message = m['message'];
    isCurrentUser = m['is_current'];
    time = m['time'];
  }
}
