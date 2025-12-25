import 'package:bubble/bubble.dart';
import 'package:caht_app/const/const.dart';
import 'package:caht_app/models/messageModel.dart';
import 'package:flutter/material.dart';

class BubbleWidget extends StatelessWidget {
  const BubbleWidget({
    super.key, required this.message,
  });
final Messagemodel message ;
  @override
  Widget build(BuildContext context) {
    return Bubble(
      alignment: Alignment.topLeft,
      nip: BubbleNip.leftTop,
      color: KPrimaryColor,
      margin: const BubbleEdges.only(top: 10),
      padding: const BubbleEdges.all(12),
      child: Text(
      message.message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
class BubbleWidgetFrind extends StatelessWidget {
  const BubbleWidgetFrind({
    super.key, required this.message,
  });
final Messagemodel message ;
  @override
  Widget build(BuildContext context) {
    return Bubble(
      alignment: Alignment.topRight,
      nip: BubbleNip.rightTop,
      color: Color(0xff0054D8),
      margin: const BubbleEdges.only(top: 10),
      padding: const BubbleEdges.all(12),
      child: Text(
      message.message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}