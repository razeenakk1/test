// Copyright 2019 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs


import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';


void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<DemoApp> {
  String text = '';
  String subject = '';

  // late bool button1;
  // @override
  // void initState() {
  //   button1 = false;
  //   // TODO: implement initState
  //   super.initState();
  // }
  // Future<Null> shareScreenshot() async {
  //   setState(() {
  //     button1 = true;
  //   });
  //   try {
  //     RenderRepaintBoundary boundary =
  //     _globalKey.currentContext.findRenderObject();
  //     if (boundary.debugNeedsPaint) {
  //       Timer(Duration(seconds: 1), () => shareScreenshot());
  //       return null;
  //     }
  //     ui.Image image = await boundary.toImage();
  //     final directory = (await getExternalStorageDirectory())!.path;
  //     ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //     Uint8List pngBytes = byteData.buffer.asUint8List();
  //     File imgFile = new File('$directory/screenshot.png');
  //     imgFile.writeAsBytes(pngBytes);
  //     final RenderObject? box = context.findRenderObject();
  //     Share.shareFile(File('$directory/screenshot.png'),
  //         subject: 'Share ScreenShot',
  //         text: 'Hello, check your share files!',
  //         sharePositionOrigin: box?.localToGlobal(Offset.zero) & box?.size
  //     );
  //   } on PlatformException catch (e) {
  //     print("Exception while taking screenshot:" + e.toString());
  //   }
  //   setState(() {
  //     button1 = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Plus Plugin Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0x9f4376f8),
      ),
      home: Scaffold(

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Share text',
                  hintText: 'Enter some text and/or link to share',
                ),
                maxLines: null,
                onChanged: (String value) => setState(() {
                  text = value;
                }),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Share subject',
                  hintText: 'Enter subject to share (optional)',
                ),
                maxLines: null,
                onChanged: (String value) => setState(() {
                  subject = value;
                }),
              ),
              const SizedBox(height: 16),


              const SizedBox(height: 32),
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: text.isEmpty
                        ? null
                        : () => _onShare(context),
                    child: const Text('Share'),
                  );
                },
              ),

              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: text.isEmpty
                        ? null
                        : () => _onShareWithResult(context),
                    child: const Text('Share With Result'),
                  );
                },
              ),
              const SizedBox(height: 16),
              // Builder(
              //   builder: (BuildContext context) {
              //     return ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         foregroundColor: Theme.of(context).colorScheme.onPrimary,
              //         backgroundColor: Theme.of(context).colorScheme.primary,
              //       ),
              //       onPressed: () {
              //         _onShareXFileFromAssets(context);
              //       },
              //       child: const Text('Share XFile from Assets'),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }



  void _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;




      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);

  }

  void _onShareWithResult(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    ShareResult shareResult;

      shareResult = await Share.shareWithResult(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);

    scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  }

  // void _onShareXFileFromAssets(BuildContext context) async {
  //   final box = context.findRenderObject() as RenderBox?;
  //   final scaffoldMessenger = ScaffoldMessenger.of(context);
  //   final data = await rootBundle.load('assets/flutter_logo.png');
  //   final buffer = data.buffer;
  //   final shareResult = await Share.shareXFiles(
  //     [
  //       XFile.fromData(
  //         buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
  //         name: 'flutter_logo.png',
  //         mimeType: 'image/png',
  //       ),
  //     ],
  //     sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  //   );
  //
  //   scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  // }

  SnackBar getResultSnackBar(ShareResult result) {
    return SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Share result: ${result.status}"),
          if (result.status == ShareResultStatus.success)
            Text("Shared to: ${result.raw}")
        ],
      ),
    );
  }
}


