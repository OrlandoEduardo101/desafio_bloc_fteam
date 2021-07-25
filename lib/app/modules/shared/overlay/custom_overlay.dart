import 'package:flutter/material.dart';

class CustomOverlayWidget extends StatelessWidget {
  // final HomeController controller = Modular.get<HomeController>();

  final String iconLabel;
  final String text;
  final Widget? content;
  final Color? color;

  CustomOverlayWidget(
      {Key? key,
      this.iconLabel = 'Atenção',
      this.text = 'Deseja mesmo alterar seus dados?',
      this.color,
      this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: content == null ? Container() : content // Center(child: content)
        );
  }
}
