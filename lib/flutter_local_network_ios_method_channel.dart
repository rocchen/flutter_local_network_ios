import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_local_network_ios_platform_interface.dart';

/// An implementation of [FlutterLocalNetworkIosPlatform] that uses method channels.
class MethodChannelFlutterLocalNetworkIos extends FlutterLocalNetworkIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_local_network_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> requestAuthorization() async {
    final result = await methodChannel.invokeMethod<bool>('requestAuthorization');
    return result;
  }
}
