import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../modules/home.dart';
import 'default_sized_box.dart';

class CheckConnectivity extends StatefulWidget {
  const CheckConnectivity({Key? key}) : super(key: key);

  @override
  State<CheckConnectivity> createState() => _CheckConnectivityState();
}

class _CheckConnectivityState extends State<CheckConnectivity> {
  ConnectivityResult _connectionStatus = ConnectivityResult.wifi;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_connectionStatus == ConnectivityResult.none){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/not-found.png')),
            const DefaultSizedBox.vertical(35),
            const Text(
              'Check you network please...',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const DefaultSizedBox.vertical(35),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
              ),
              onPressed: () async {
                ConnectivityResult result =
                await Connectivity().checkConnectivity();
                if(result ==ConnectivityResult.wifi ) Home();
                print(result.toString());
              },
              child: const Text("Refresh"),
            ),
          ],
        ),
      );
    }
    else{
      return Home();
    }

  }
}
