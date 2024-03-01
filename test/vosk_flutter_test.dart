import 'package:flutter_test/flutter_test.dart';
import 'package:vosk_flutter/vosk_flutter.dart';
import 'package:vosk_flutter/vosk_flutter_platform_interface.dart';
import 'package:vosk_flutter/vosk_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVoskFlutterPlatform
    with MockPlatformInterfaceMixin
    implements VoskFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final VoskFlutterPlatform initialPlatform = VoskFlutterPlatform.instance;

  test('$MethodChannelVoskFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVoskFlutter>());
  });

  test('getPlatformVersion', () async {
    VoskFlutter voskFlutterPlugin = VoskFlutter();
    MockVoskFlutterPlatform fakePlatform = MockVoskFlutterPlatform();
    VoskFlutterPlatform.instance = fakePlatform;

    expect(await voskFlutterPlugin.getPlatformVersion(), '42');
  });
}
