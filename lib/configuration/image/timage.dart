import 'package:flutter/material.dart';

class TNetImage extends StatelessWidget {
  TNetImage({
    required this.path,
    this.height = 100,
    this.width = 100,
    this.fit = BoxFit.fill,
    Key? key,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);
  String path;
  double height;
  double width;
  BoxFit fit;
  BorderRadius? borderRadius;

  final String load1 = 'assets/Icons/Spinner-1s-200px.gif';
   String _error = "assets/Icons/erroeLoad.jpeg";
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: FadeInImage(
        height: height,
        width: width,
        // for loading
        placeholderFit: BoxFit.contain,
        placeholder: AssetImage(load1),
        image: NetworkImage(path, scale: 0.5),
        fit: fit,
        imageErrorBuilder: (context, error, st) {
          return Container(
            alignment: Alignment.center,
            height: height,
            width: width,
            // for error
            decoration:  BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_error),
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
