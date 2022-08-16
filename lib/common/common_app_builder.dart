import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

Widget commonAppBuilder(BuildContext context, Widget? child) {
  if (MediaQuery.of(context).size.width > 440) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DeviceFrame(
        device: Devices.ios.iPhone13,
        screen: child ?? const SizedBox.shrink(),
      ),
    );
  }
  return child ?? const SizedBox.shrink();
}
