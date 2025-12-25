import 'package:caht_app/const/const.dart';
import 'package:caht_app/models/messageModel.dart';
import 'package:caht_app/widgets/bubble_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chatpage extends StatelessWidget {
  const Chatpage({super.key});
  static String id = 'chatpage';

  @override
  Widget build(BuildContext context) {
     final String email =
      ModalRoute.of(context)!.settings.arguments as String;
    CollectionReference messages = FirebaseFirestore.instance.collection(
      KmessageCollection,
    );
    TextEditingController messageController = TextEditingController();
    final ScrollController _controller = ScrollController();
    void _scrollDown() {
      _controller.jumpTo(
        0,
        // _controller.position.maxScrollExtent,
      );
    }

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy("createAt", descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Messagemodel> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messageList.add(Messagemodel.fromJson(snapshot.data!.docs[i]));
          }
          print(snapshot.data!);

          return Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: FloatingActionButton(backgroundColor: KPrimaryColor,
                    child: Center(child: Icon(Icons.arrow_downward,color: Colors.white,)),
                    onPressed: () {
                      _scrollDown();
                    },
                  ),
            ),
            appBar: AppBar(
              leading:Container(),
              backgroundColor: KPrimaryColor,

              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/scholar.png", height: 50.h),
                  SizedBox(width: 10.w),
                  Text(
                    "Scholar Chat",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    
                    controller: _controller,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? BubbleWidget(message: messageList[index])
                          : BubbleWidgetFrind(message: messageList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 16.0,
                  ),
                  child: TextField(
                    controller: messageController,
                    onSubmitted: (data) {
                      messages.add({
                        "message": data,
                        "createAt": DateTime.now(),
                        "id" :email
                      });
                      messageController.clear();
                      _scrollDown();
                    },
                    cursorColor: KPrimaryColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: KPrimaryColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: "Type your message",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10.sp),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: KPrimaryColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      suffixIcon: IconButton(
                        color: KPrimaryColor,
                        icon: Icon(Icons.send),
                        onPressed: () {
                          // Handle send action
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text("loading.........");
        }
      },
    );
  }
}
