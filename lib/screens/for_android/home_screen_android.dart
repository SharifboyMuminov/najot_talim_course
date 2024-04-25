import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreenForAndroid extends StatefulWidget {
  const HomeScreenForAndroid({super.key});

  @override
  State<HomeScreenForAndroid> createState() => _HomeScreenForAndroidState();
}

class _HomeScreenForAndroidState extends State<HomeScreenForAndroid> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';
  bool loading = false;

  String deviceInfo = "";
  String phoneID = "";
  String phoneDevice = "";
  String phoneBrand = "";

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;

    phoneID = androidDeviceInfo.id;
    phoneDevice = androidDeviceInfo.device;
    phoneBrand = androidDeviceInfo.brand;
    setState(() {
      loading = false;
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const Icon(
                        Icons.battery_alert_rounded,
                        color: Colors.green,
                        size: 28,
                      ),
                      Text(
                        _batteryLevel,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Phone id: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(
                        phoneID,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Phone device: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(
                        phoneDevice,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Device info : ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(
                        deviceInfo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Phone brand : ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(
                        phoneBrand,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        _getBatteryLevel();
                      },
                      child: const Text(
                        "Get Info",
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
