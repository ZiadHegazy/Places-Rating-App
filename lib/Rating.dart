import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int value;
  const Rating({this.value = 0});

  @override
  Widget build(BuildContext context) {
    Color color= value==1?Color.fromRGBO(218, 3, 95, 1):value==2?Colors.yellow:Colors.green;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          fill:1,
          color: index < value ? color : Colors.grey,
        );
      }),
    );
  }
}