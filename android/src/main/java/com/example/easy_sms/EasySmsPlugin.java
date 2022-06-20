package com.example.easy_sms;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import android.telephony.SmsManager;

/** EasySmsPlugin */
public class EasySmsPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "sendSms");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("sendSms")) {
        String num = call.argument("phone");
        String msg = call.argument("msg");
        // result.success("Android " + android.os.Build.VERSION.RELEASE); 
        sendSMS(num,msg,result);
      } else {
        result.notImplemented();
      }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

    private void sendSMS(String phoneNo, String msg,MethodChannel.Result result) {
      try {
          SmsManager smsManager = SmsManager.getDefault();
          smsManager.sendTextMessage(phoneNo, null, msg, null, null);
          result.success("SMS Sent");
      } catch (Exception ex) {
          ex.printStackTrace();
          result.error("Err","Sms Not Sent","");
      }
  }
}
