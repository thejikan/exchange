import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'icons_enum.dart';

class IconAtom extends StatelessWidget {
  final IconsEnum icon;
  final BoxFit? fit;
  final EdgeInsets? padding;

  const IconAtom({
    Key? key,
    required this.icon,
    this.fit,
    this.padding,
  }) : super(key: key);
  final baseUrl = 'assets/';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: SvgPicture.asset(
        baseUrl + icon.urlName,
        semanticsLabel: icon.label,
        fit: fit ?? BoxFit.contain,
        // package: 'udt_design_system',
      ),
    );
  }
}
