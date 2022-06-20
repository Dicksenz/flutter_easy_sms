import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'easy_sms_method_channel.dart';

abstract class EasySmsPlatform extends PlatformInterface {
  /// Constructs a EasySmsPlatform.
  EasySmsPlatform() : super(token: _token);

  static final Object _token = Object();

  static EasySmsPlatform _instance = MethodChannelEasySms();

  /// The default instance of [EasySmsPlatform] to use.
  ///
  /// Defaults to [MethodChannelEasySms].
  static EasySmsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EasySmsPlatform] when
  /// they register themselves.
  static set instance(EasySmsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> sendSms({required String phone, required String msg}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
