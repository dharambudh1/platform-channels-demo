# Platform Channels Demo

## Description:
The following code demonstrates how to call a platform-specific API to retrieve and display the current battery level. It uses the Android `BatteryManager` API, the iOS `device.batteryLevel` API, the Windows `GetSystemPowerStatus` API, and the Linux `UPower` API with a single platform message, `getBatteryLevel()`.

The example adds the platform-specific code inside the main app itself. If you want to reuse the platform-specific code for multiple apps, the project creation step is slightly different (see [developing packages](https://docs.flutter.dev/packages-and-plugins/developing-packages#plugin)), but the platform channel code is still written in the same way.

Important: The "`device.batteryLevel` API" feature is incompatible with iOS simulators; it requires a physical iOS device to perform such functionality. I don't have access to such a device, so I did not test this code on the iOS platform.

  - For more information, visit: https://docs.flutter.dev/platform-integration/platform-channels
  - For detailed example, visit: https://docs.flutter.dev/platform-integration/platform-channels?tab=type-mappings-kotlin-tab#example

## Preview
![alt text](https://i.postimg.cc/P5XJdRwk/imgonline-com-ua-twotoone-G2dm-Io4na-Kn-Hy.png "img")
