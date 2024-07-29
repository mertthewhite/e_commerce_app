import 'dart:io';
import 'dart:async';

Future<bool> hasNetwork(
    {Duration timeout = const Duration(seconds: 3),
    int speedThresholdKbps = 30}) async {
  try {
    final result = await InternetAddress.lookup('example.com').timeout(timeout);
    if (result.isEmpty || result[0].rawAddress.isEmpty) {
      return false;
    }

    final bool speedIsAdequate =
        await _checkInternetSpeed(speedThresholdKbps, timeout);

    return speedIsAdequate;
  } on SocketException catch (_) {
    return false;
  } on TimeoutException catch (_) {
    return false;
  }
}

Future<bool> _checkInternetSpeed(
    int speedThresholdKbps, Duration timeout) async {
  try {
    final stopwatch = Stopwatch()..start();

    // Download a small file
    final request = await HttpClient().getUrl(Uri.parse(
        'https://drive.google.com/file/d/1lEn1DtJQW6-nTcoS_FG7-EB3Kamy0147/view?usp= paylaşım')); // Replace with a real small file URL
    final response = await request.close().timeout(timeout);

    // Check the status code
    if (response.statusCode != 200) {
      return false;
    }

    // Measure the download speed
    int totalBytes = 0;
    await for (var data in response) {
      totalBytes += data.length;
    }

    stopwatch.stop();
    final downloadTimeSec = stopwatch.elapsedMilliseconds / 1000;
    final speedKbps = (totalBytes / 1024) / downloadTimeSec;
    print('Speed: $speedKbps KB/s');
    return speedKbps >= speedThresholdKbps;
  } catch (e) {
    return false;
  }
}
