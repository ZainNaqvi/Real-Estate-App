import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:houses_olx/house/components/body.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'components/appbar.dart';

class HouseScreen extends StatefulWidget {
  @override
  _HouseScreenState createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen>
    with SingleTickerProviderStateMixin {
  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll(".", "-")
        .replaceAll(":", "-");
    final name = "screenshot_$time";
    final result = await ImageGallerySaver.saveImage(bytes, name: name);

    return result['filePath'];
  }

  final _controller = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isDialOpen = ValueNotifier(false);
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Screenshot(
        controller: _controller,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppbar(),
          body: Body(),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: Colors.green[900],
            overlayColor: Colors.black.withOpacity(0.04),
            spacing: 4.h,
            spaceBetweenChildren: 12.h,
            openCloseDial: isDialOpen,
            children: [
              SpeedDialChild(
                child: Icon(Icons.share),
                label: "Share",
                backgroundColor: Colors.green[300],
                onTap: () {},
              ),
              SpeedDialChild(
                child: Icon(Icons.star),
                label: "Rate App",
                backgroundColor: Colors.green[300],
                onTap: () {},
              ),
              SpeedDialChild(
                child: Icon(Icons.screenshot),
                label: "Take Snap",
                backgroundColor: Colors.green[300],
                onTap: () async {
                  final image = await _controller.capture();
                  if (image == null) return;
                  final result = await saveImage(image);
                  print(result);
                },
              ),
              SpeedDialChild(
                child: Icon(Icons.add),
                label: "Add post",
                backgroundColor: Colors.green[300],
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
