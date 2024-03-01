import Flutter
import UIKit

public class VoskFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    setenv("LIBVOSK_PATH", Bundle.main.privateFrameworksPath! + "/libvosk.a", 0);

    let channel = FlutterMethodChannel(name: "vosk_flutter", binaryMessenger: registrar.messenger())
    let instance = VoskFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
