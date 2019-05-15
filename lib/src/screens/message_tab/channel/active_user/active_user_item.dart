import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/components/active_user/active_user_model.dart';
import 'package:study_flutter_v158/src/shared/widgets/image_cached.dart';

class UserActiveItem extends StatelessWidget {
  final ActiveUserModel activeUser;

  const UserActiveItem({this.activeUser}) : assert(activeUser != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ImageCached(
                  width: 40, height: 40, url: this.activeUser.imagePath),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: new BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          Text(
            this.activeUser.name,
          ),
        ],
      ),
    );
  }
}
