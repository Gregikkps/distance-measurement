// ignore_for_file: avoid_log

import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class NetworkParametersInspector {
  String connectionStatus = 'Unknown';
  final NetworkInfo _networkInfo = NetworkInfo();
  String? wifiName, wifiBSSID, wifiIPv4, wifiIPv6, wifiGatewayIP, wifiBroadcast, wifiSubmask;

  Future<void> getWifiGatewayIP() async {
    try {
      wifiGatewayIP = await _networkInfo.getWifiGatewayIP();
    } on PlatformException catch (e) {
      log('Failed to get Wifi gateway address', error: e);
      wifiGatewayIP = 'Failed to get Wifi gateway address';
    }

    wifiGatewayIP = wifiGatewayIP;
    log(wifiGatewayIP ?? 'null');
  }

  Future<void> getAllNetworkInfo() async {
    try {
      if (Platform.isIOS) {
        var status = await Permission.location.status;
        if (status.isDenied || status.isRestricted) {
          if (await Permission.location.request().isGranted) {
            log('Location permission granted');
          } else {
            log('Location permission not granted');
          }
        }
        if (status.isGranted) {
          wifiName = await _networkInfo.getWifiName();
        } else {
          wifiName = 'Location permission not granted';
        }
      }

      if (Platform.isAndroid) {
        log('Checking Android permissions');
        var status = await Permission.location.status;
        if (status.isDenied || status.isRestricted) {
          if (await Permission.location.request().isGranted) {
            log('Location permission granted');
          } else {
            log('Location permission not granted');
          }
        }

        if ((status.isGranted)) {
          log('Permission already granted (previous execution?)');
          wifiName = await _networkInfo.getWifiName();
          log(wifiName ?? 'null');
        }
      } else {
        wifiName = await _networkInfo.getWifiName();
      }
    } on PlatformException catch (e) {
      log('Failed to get Wifi Name', error: e);
      wifiName = 'Failed to get Wifi Name';
    }

    try {
      if (Platform.isIOS) {
        var status = await Permission.location.status;
        if (!status.isGranted) {
          status = await Permission.location.request();
        }
        if (status.isGranted || status.isLimited) {
          wifiBSSID = await _networkInfo.getWifiBSSID();
        } else {
          wifiBSSID = await _networkInfo.getWifiBSSID();
        }
      } else {
        wifiBSSID = await _networkInfo.getWifiBSSID();
      }
    } on PlatformException catch (e) {
      log('Failed to get Wifi BSSID', error: e);
      wifiBSSID = 'Failed to get Wifi BSSID';
    }

    try {
      wifiIPv4 = await _networkInfo.getWifiIP();
    } on PlatformException catch (e) {
      log('Failed to get Wifi IPv4', error: e);
      wifiIPv4 = 'Failed to get Wifi IPv4';
    }

    try {
      wifiIPv6 = await _networkInfo.getWifiIPv6();
    } on PlatformException catch (e) {
      log('Failed to get Wifi IPv6', error: e);
      wifiIPv6 = 'Failed to get Wifi IPv6';
    }

    try {
      wifiSubmask = await _networkInfo.getWifiSubmask();
    } on PlatformException catch (e) {
      log('Failed to get Wifi submask address', error: e);
      wifiSubmask = 'Failed to get Wifi submask address';
    }

    try {
      wifiBroadcast = await _networkInfo.getWifiBroadcast();
    } on PlatformException catch (e) {
      log('Failed to get Wifi broadcast', error: e);
      wifiBroadcast = 'Failed to get Wifi broadcast';
    }

    try {
      wifiGatewayIP = await _networkInfo.getWifiGatewayIP();
    } on PlatformException catch (e) {
      log('Failed to get Wifi gateway address', error: e);
      wifiGatewayIP = 'Failed to get Wifi gateway address';
    }

    try {
      wifiSubmask = await _networkInfo.getWifiSubmask();
    } on PlatformException catch (e) {
      log('Failed to get Wifi submask', error: e);
      wifiSubmask = 'Failed to get Wifi submask';
    }

    connectionStatus = 'Wifi Name: $wifiName\n'
        'Wifi BSSID: $wifiBSSID\n'
        'Wifi IPv4: $wifiIPv4\n'
        'Wifi IPv6: $wifiIPv6\n'
        'Wifi Broadcast: $wifiBroadcast\n'
        'Wifi Gateway: $wifiGatewayIP\n'
        'Wifi Submask: $wifiSubmask\n';
    log(connectionStatus);
  }
}
