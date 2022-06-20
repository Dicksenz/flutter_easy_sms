# Flutter Send SMS plugin

A Flutter SMS plugin which sends SMS in background without UI interactions.

## Features

- Request SMS permission.
- Sends SMS in background.

## Usage

To add the plugin to your Flutter application, below are some Android specifics that are required for the geolocator to work correctly.

**Permissions**

On Android you'll need to add the following permissions to your Android Manifest. To do so open the AndroidManifest.xml file (located under android/app/src/main) and add one of the following five lines as direct children of the `<manifest>`:

```xml
    <uses-permission android:name="android.permission.SEND_SMS"/>
    <uses-permission android:name="android.permission.RECEIVE_SMS"/>
    <uses-permission android:name="android.permission.READ_SMS"/>
    <uses-permission android:name="android.permission.RECEIVE_WAP_PUSH"/>
    <uses-permission android:name="android.permission.RECEIVE_MMS"/>
```

### Example

The code below shows an example on how to send SMS:

```dart
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
```
