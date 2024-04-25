import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreenForIos extends StatefulWidget {
  const HomeScreenForIos({super.key});

  @override
  State<HomeScreenForIos> createState() => _HomeScreenForIosState();
}

class _HomeScreenForIosState extends State<HomeScreenForIos> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';
  bool loading = false;

  String model = "";
  String name = "";
  String phoneVersion = "";
  String phoneSystemName = "";

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    name = iosDeviceInfo.name;
    phoneVersion = iosDeviceInfo.systemVersion;
    phoneSystemName = iosDeviceInfo.systemName;
    model = iosDeviceInfo.model;

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
                      Expanded(
                        child: Text(
                          _batteryLevel,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 23),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Phone name: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(
                        name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Phone version: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(
                        phoneVersion,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Model: ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(
                        model,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Phone systame name : ",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      Text(
                        phoneSystemName,
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
