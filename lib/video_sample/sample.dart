import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  File? _video;
  File? _cameraVideo;

  ImagePicker picker = ImagePicker();

  late VideoPlayerController _videoPlayerController;
  late VideoPlayerController _cameraVideoPlayerController;

  _pickVideo() async {
    XFile? pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    _video = File(pickedFile!.path);

    _videoPlayerController = VideoPlayerController.file(_video!)
      ..initialize().then((_) {
        setState(() {
          _videoPlayerController.play();
        });
      });
  }

  _pickVideoFromCamera() async {
    XFile? pickedFile = await picker.pickVideo(source: ImageSource.camera);

    _cameraVideo = File(pickedFile!.path);

    _cameraVideoPlayerController = VideoPlayerController.file(_cameraVideo!)
      ..initialize().then((_) {
        setState(() {
          _cameraVideoPlayerController.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                if (_video != null)
                  _videoPlayerController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController),
                        )
                      : Container()
                else
                  const Text(
                    "Click on Pick Video to select video",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    await _pickVideo();
                  },
                  child: const Text("Pick Video From Gallery"),
                ),
                if (_cameraVideo != null)
                  _cameraVideoPlayerController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio:
                              _cameraVideoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_cameraVideoPlayerController),
                        )
                      : Container()
                else
                  const Text(
                    "Click on Pick Video to select video",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ElevatedButton(
                  onPressed: () {
                    _pickVideoFromCamera();
                  },
                  child: const Text("Pick Video From Camera"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
