import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    // connect();
  }

  // void connect() {
  //   IO.Socket socket = IO.io('http://localhost:3000');
  //   socket.onConnect((_) {
  //     print('connect');
  //     socket.emit('msg', 'test');
  //   });
  //   socket.on('event', (data) => print(data));
  //   socket.onDisconnect((_) => print('disconnect'));
  //   socket.on('fromServer', (_) => print(_));
  // }

  // channelconnect() {
  //   //function to connect
  //   try {
  //     channel = IOWebSocketChannel.connect(
  //         "ws://192.168.0.109:6060/$myid"); //channel IP : Port
  //     channel.stream.listen(
  //       (message) {
  //         print(message);
  //         setState(() {
  //           if (message == "connected") {
  //             connected = true;
  //             setState(() {});
  //             print("Connection establised.");
  //           } else if (message == "send:success") {
  //             print("Message send success");
  //             setState(() {
  //               msgtext.text = "";
  //             });
  //           } else if (message == "send:error") {
  //             print("Message send error");
  //           } else if (message.substring(0, 6) == "{'cmd'") {
  //             print("Message data");
  //             message = message.replaceAll(RegExp("'"), '"');
  //             var jsondata = json.decode(message);

  //             msglist.add(MessageData(
  //               //on message recieve, add data to model
  //               msgtext: jsondata["msgtext"],
  //               userid: jsondata["userid"],
  //               isme: false,
  //             ));
  //             setState(() {
  //               //update UI after adding data to message model
  //             });
  //           }
  //         });
  //       },
  //       onDone: () {
  //         //if WebSocket is disconnected
  //         print("Web socket is closed");
  //         setState(() {
  //           connected = false;
  //         });
  //       },
  //       onError: (error) {
  //         print(error.toString());
  //       },
  //     );
  //   } catch (_) {
  //     print("error on connecting to websocket.");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          _buildNoMessageText(context),
          _buildTypeMessage(context),
        ],
      ),
    );
  }

  Widget _buildNoMessageText(BuildContext context) {
    return Positioned(
      top: 90,
      bottom: 60,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text('No Messages'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeMessage(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const TextField(
                  decoration: InputDecoration(hintText: "Message .."),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: const Icon(Icons.send),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
