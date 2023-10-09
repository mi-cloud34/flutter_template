
import 'package:flutter_architecture/core/extensions/string_extension.dart';

class SVGImagePaths {
  SVGImagePaths._init();
  static SVGImagePaths? _instace;
  static SVGImagePaths get instance {
    return _instace ??= SVGImagePaths._init();
  }

  final one = 'one'.toSVG;
  final twoo = 'two'.toSVG;
  final three = 'three'.toSVG;
}