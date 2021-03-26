import 'package:band_name/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class StatusPage extends StatelessWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  final socketService = Provider.of<SocketService>(context);
  //socketServer.emit()

    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text('Server Status: ${socketService.serverStatus}'),

        ]
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: (){
          print("adsas");
          socketService.emit("nuevo-mensaje",{"message":"test mensahe"});
        },
      ),
    );
  }
}