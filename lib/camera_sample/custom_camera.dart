import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import '../TopUpScreen/CameraSecton/camera_screen.dart';

class CustomCamera extends StatefulWidget {
  const CustomCamera({Key? key}) : super(key: key);

  @override
  State<CustomCamera> createState() => _CustomCameraState();
}

class _CustomCameraState extends State<CustomCamera> {
  late CameraController controller ;
  int _pointers = 0;
  double _currentScale = 1.0;
  double _baseScale = 1.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  int _cameraIndex = 0;
  bool _cameraNotAvailable = false;
  XFile? imageFile;
  XFile? videoFile;
  VideoPlayerController? videoController;



  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
    // if (cameras == null || cameras.isEmpty) {
    //   setState(() {
    //     _cameraNotAvailable = true;
    //   });
    // }
    // _initCamera(_cameraIndex);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          _cameraPreviewWidget(),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildGalleryBar(),
                _buildControlBar(),
               // _buildTapForPhotoText(),
              ]
          ),
        ],


      ),
    );
  }
  void _showCameraException(CameraException e) {
    logError(e.code, e.description!);

    // _showInSnackBar('Error: ${e.code}\n${e.description}');
  }
  void logError(String code, String message) =>
      print('Error: $code\nError Message: $message');
  void _initCamera(int index) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameras[index], ResolutionPreset.high);

    // If the controller is updated then update the UI.
    // controller.addListener(() {
    //   if (mounted) setState(() {});
    //   if (controller.value.hasError) {
    //
    //
    //     _showInSnackBar('Camera error ${controller.value.errorDescription}'
    //     );
    //   }
    // });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {
        _cameraIndex = index;
      });
    }
  }
  Widget _buildControlBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.flash_auto),
          onPressed: () {},
        ),
        GestureDetector(
          onTap: _onTakePictureButtonPress,
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 5.0,
              ),
            ),
          ),
        ),
        IconButton(
          color: Colors.white,
          icon: Icon(Icons.switch_camera),
          onPressed: _onSwitchCamera,
        ),
      ],
    );
  }
  Widget _buildGalleryBar() {
    final barHeight = 90.0;
    final vertPadding = 10.0;

    return Container(
      height: barHeight,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: vertPadding),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int _) {
          return Container(
            padding: EdgeInsets.only(right: 5.0),
            width: 70.0,
            height: barHeight - vertPadding * 2,
            child: Image(
              image: randomImageUrl(),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
  ImageProvider randomImageUrl() {
    return AssetImage('assets/150x150.png');
  }
  void _onSwitchCamera() {
    if (controller == null ||
        !controller.value.isInitialized ||
        controller.value.isTakingPicture) {
      return;
    }
    final newIndex = _cameraIndex + 1 == cameras.length ? 0 : _cameraIndex + 1;
    _initCamera(newIndex);
  }



  Widget _cameraPreviewWidget() {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Listener(
        onPointerDown: (_) => _pointers++,
        onPointerUp: (_) => _pointers--,
        child: CameraPreview(
          controller,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onScaleStart: _handleScaleStart,
                  onScaleUpdate: _handleScaleUpdate,
                  onTapDown: (TapDownDetails details) =>
                      onViewFinderTap(details, constraints),
                );
              }),
        ),
      );
    }
  }
  void _handleScaleStart(ScaleStartDetails details) {
    _baseScale = _currentScale;
  }

  Future<void> _handleScaleUpdate(ScaleUpdateDetails details) async {
    // When there are not exactly two fingers on screen don't scale
    if (controller == null || _pointers != 2) {
      return;
    }

    _currentScale = (_baseScale * details.scale)
        .clamp(_minAvailableZoom, _maxAvailableZoom);

    await controller.setZoomLevel(_currentScale);
  }
  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (controller == null) {
      return;
    }

    final CameraController cameraController = controller;

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    cameraController.setExposurePoint(offset);
    cameraController.setFocusPoint(offset);
  }

  void _onTakePictureButtonPress() {
    takePicture().then((filePath) {
      if (filePath != null) {
        // _showInSnackBar('Picture saved to $filePath');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Scaffold(


            appBar: AppBar(
              backgroundColor: Colors.black,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.crop_rotate),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.insert_emoticon),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.text_fields),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
            body: Container(
              color: Colors.black,
              child: Center(
                child: Image.file(File(imageFile!.path)),
              ),
            ),
          );
        }));
      }
    });
  }
  String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();


  // Future<String> _takePicture( ) async {
  //   if (!controller.value.isInitialized || controller.value.isTakingPicture) {
  //
  //   }
  //   final Directory extDir = await getApplicationDocumentsDirectory();
  //   final String dirPath = '${extDir.path}/Pictures/whatsapp_clone';
  //   await Directory(dirPath).create(recursive: true);
  //   final String filePath = '$dirPath/${_timestamp()}.jpg';
  //
  //   try {
  //     await controller.takePicture(filePath);
  //     //filePath
  //   } on CameraException catch (e) {
  //     _showCameraException(e);
  //
  //   }
  //   return filePath;
  // }
  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          imageFile = file;
          // videoController?.dispose();
          // videoController = null;
        });
        if (file != null) {
        //  showInSnackBar('Picture saved to ${file.path}');
        }
      }
    });
  }
  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
    //  showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }
}
