import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus{
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier{

  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus =>this._serverStatus;
  IO.Socket get socket => this._socket;
  Function get emit =>this._socket.emit;

  SocketService(){
    this._initConfig();
  }

  void _initConfig(){
    // IO.Socket socket = IO.io("http://10.0.2.2:3000/",{
    this._socket = IO.io("http://192.168.1.5:5000",<String, dynamic>{
    // IO.Socket socket = IO.io("http://10.0.2.2:3000/",<String, dynamic>{
      'transports':["websocket"],
      'autoConnect':true,
    });

    this._socket.onConnect((data) {
      this._serverStatus= ServerStatus.Online;
      notifyListeners();
    });

    this._socket.on("disconnect",(_){
      this._serverStatus= ServerStatus.Offline;
      notifyListeners();
    });
  }

}