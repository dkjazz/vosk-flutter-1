import Flutter
 
public class VoskFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    vosk_set_log_level(0)
    let channel = FlutterMethodChannel(name: "vosk_flutter", binaryMessenger: registrar.messenger())
    let instance = VoskFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
}