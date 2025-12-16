import 'package:bubble/bubble.dart';
import 'package:caht_app/const/const.dart';
import 'package:flutter/material.dart';

class BubbleWidget extends StatelessWidget {
  const BubbleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Bubble(
      alignment: Alignment.topLeft,
      nip: BubbleNip.leftTop,
      color: KPrimaryColor,
      margin: const BubbleEdges.only(top: 10),
      padding: const BubbleEdges.all(12),
      child: const Text(
        "i am a new user",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}