import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageCached extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const ImageCached({@required this.url, this.width = 50, this.height = 50})
      : assert(url != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: CachedNetworkImageProvider(this.url),
        ),
      ),
    );
  }
}
