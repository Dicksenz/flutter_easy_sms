import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'easy_sms_platform_interface.dart';

/// An implementation of [EasySmsPlatform] that uses method channels.
class MethodChannelEasySms extends EasySmsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sendSms');

  @override
  Future<String?> sendSms({required String phone, required msg}) async {
    final version = await methodChannel.invokeMethod<String>(
        'sendSms', <String, dynamic>{"phone": phone, "msg": msg});
    return version;
  }
}
