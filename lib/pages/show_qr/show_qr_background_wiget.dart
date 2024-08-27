import 'dart:math';

import 'package:flutter/material.dart';

class ShowQrBackgroundWidget extends StatelessWidget {
  const ShowQrBackgroundWidget({
    super.key,
    required this.icons,
  });

  final List<String> icons;

  String _getIcon() {
    return icons[Random().nextInt(icons.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Text(
        '${_getIcon()}     ${_getIcon()}        ${_getIcon()}  \n    ${_getIcon()}      ${_getIcon()}    \n   ${_getIcon()}     ${_getIcon()}    ${_getIcon()} \n    ${_getIcon()}      ${_getIcon()}    ${_getIcon()}   \n   ${_getIcon()}     ${_getIcon()}   \n     ${_getIcon()}      ${_getIcon()}      ${_getIcon()}     ${_getIcon()}        ${_getIcon()}  \n  ${_getIcon()}        ${_getIcon()}\n     ${_getIcon()}      ${_getIcon()}      ${_getIcon()}     ${_getIcon()}        ${_getIcon()}  \n  ${_getIcon()}        ${_getIcon()}',
        style: const TextStyle(
          fontSize: 52,
        ),
      ),
    );
  }
}
