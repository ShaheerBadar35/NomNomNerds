//THIS SCREEN IS OF NO USE AS OPENAI API IS PAID AND CAN NOT BE USED 



// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   bool _isTyping = false;

//   late TextEditingController textEditingController;
//   late ScrollController _listScrollController;
//   late FocusNode focusNode;
//   @override
//   void initState() {
//     _listScrollController = ScrollController();
//     textEditingController = TextEditingController();
//     focusNode = FocusNode();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _listScrollController.dispose();
//     textEditingController.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }

//   // List<ChatModel> chatList = [];
//   @override
//   Widget build(BuildContext context) {
//     //final modelsProvider = Provider.of<ModelsProvider>(context);
//     //final chatProvider = Provider.of<ChatProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 2,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Icon(Icons.person),
//         ),
//         title: const Text("Online Assistant"),
//         // actions: [
//         //   IconButton(
//         //     onPressed: () async {
//         //       await Services.showModalSheet(context: context);
//         //     },
//         //     icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
//         //   ),
//         // ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Flexible(
//               child: ListView.builder(
//                   //controller: _listScrollController,
//                   //itemCount: chatProvider.getChatList.length, //chatList.length,
//                   itemCount: 6,
//                   itemBuilder: (context, index) {
//                     // return ChatWidget(
//                     //   msg: chatProvider
//                     //       .getChatList[index].msg, // chatList[index].msg,
//                     //   chatIndex: chatProvider.getChatList[index]
//                     //       .chatIndex, //chatList[index].chatIndex,
//                     //   shouldAnimate:
//                     //       chatProvider.getChatList.length - 1 == index,
//                     // );
//                     return const Text("Nom Nom Nerds Assitant");
//                   }),
//             ),
//             if (_isTyping) ...[
//               const SpinKitThreeBounce(
//                 color: Colors.black,
//                 size: 18,
//               ),
//             ],
//             const SizedBox(
//               height: 15,
//             ),
//             Material(
//               color: cardColor,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         focusNode: focusNode,
//                         style: const TextStyle(color: Colors.white),
//                         controller: textEditingController,
//                         onSubmitted: (value) async {
//                           await sendMessageFCT(
//                               modelsProvider: modelsProvider,
//                               chatProvider: chatProvider);
//                         },
//                         decoration: const InputDecoration.collapsed(
//                             hintText: "How can I help you",
//                             hintStyle: TextStyle(color: Colors.grey)),
//                       ),
//                     ),
//                     IconButton(
//                         onPressed: () async {
//                           await sendMessageFCT(
//                               modelsProvider: modelsProvider,
//                               chatProvider: chatProvider);
//                         },
//                         icon: const Icon(
//                           Icons.send,
//                           color: Colors.white,
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void scrollListToEND() {
//     _listScrollController.animateTo(
//         _listScrollController.position.maxScrollExtent,
//         duration: const Duration(seconds: 2),
//         curve: Curves.easeOut);
//   }

//   Future<void> sendMessageFCT(
//       {required ModelsProvider modelsProvider,
//       required ChatProvider chatProvider}) async {
//     if (_isTyping) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: TextWidget(
//             label: "You cant send multiple messages at a time",
//           ),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//     if (textEditingController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: TextWidget(
//             label: "Please type a message",
//           ),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//     try {
//       String msg = textEditingController.text;
//       setState(() {
//         _isTyping = true;
//         // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
//         chatProvider.addUserMessage(msg: msg);
//         textEditingController.clear();
//         focusNode.unfocus();
//       });
//       await chatProvider.sendMessageAndGetAnswers(
//           msg: msg, chosenModelId: modelsProvider.getCurrentModel);
//       // chatList.addAll(await ApiService.sendMessage(
//       //   message: textEditingController.text,
//       //   modelId: modelsProvider.getCurrentModel,
//       // ));
//       setState(() {});
//     } catch (error) {
//       log("error $error");
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: TextWidget(
//           label: error.toString(),
//         ),
//         backgroundColor: Colors.red,
//       ));
//     } finally {
//       setState(() {
//         scrollListToEND();
//         _isTyping = false;
//       });
//     }
//   }
// }
