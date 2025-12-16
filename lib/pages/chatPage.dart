import 'package:bubble/bubble.dart';
import 'package:caht_app/const/const.dart';
import 'package:caht_app/widgets/bubble_widget.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatelessWidget {
  const Chatpage({super.key});
  static String id = 'chatpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KPrimaryColor,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/scholar.png", height: 50),
            SizedBox(width: 10),
            Text(
              "Scholar Chat",
              style: TextStyle(fontFamily: 'Pacifico', color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return BubbleWidget();
               
              },
            
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Type your message",
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(borderSide: BorderSide(color: KPrimaryColor),
                borderRadius: BorderRadius.circular(16),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // Handle send action
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


