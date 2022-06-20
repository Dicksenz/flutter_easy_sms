import 'dart:async';

import 'package:easy_sms/easy_sms.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _easySmsPlugin = EasySms();

  Future<void> sendSms({required String phone, required msg}) async {
    try {
      await _easySmsPlugin.requestSmsPermission();
      await _easySmsPlugin.sendSms(phone: phone, msg: msg);
    } catch (err) {
      if (kDebugMode) {
        print(err.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Send SMS example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // enter mobile number here
              sendSms(phone: 'xxxxxxxxx', msg: 'This is a test !!');
            },
            child: const Text('send sms'),
          ),
        ),
      ),
    );
  }
}
