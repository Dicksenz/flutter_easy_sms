import 'package:permission_handler/permission_handler.dart';

import 'easy_sms_platform_interface.dart';

class EasySms {
  Future<void> requestSmsPermission() async {
    await Permission.sms.request();
    var status = await Permission.sms.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.

    }

// You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
  }

  Future<String?> sendSms({required String phone, required String msg}) {
    return EasySmsPlatform.instance.sendSms(phone: phone, msg: msg);
  }
}
