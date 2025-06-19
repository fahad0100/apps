import 'package:flutter/material.dart';

extension SizeScreen on BuildContext {
  getSizeWidth({double? size = 1}) {
    return MediaQuery.sizeOf(this).width * size!;
  }

  getSizeHeight({double? size = 1}) {
    return MediaQuery.sizeOf(this).height * size!;
  }
}
