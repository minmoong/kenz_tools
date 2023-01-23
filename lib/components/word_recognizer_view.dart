import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class WordRecognizerView extends StatefulWidget {
  WordRecognizerView({Key? key}) : super(key: key);

  @override
  _WordRecognizerViewState createState() => _WordRecognizerViewState();
}

class _WordRecognizerViewState extends State<WordRecognizerView> {
  PickedFile? pickedImage;
  String? text;
  String path = '';
  String? imageBase64;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: ocr,
          child: const Text('사진 선택하기'),
        ),
        path.isEmpty
            ? Container()
            : path.contains('http')
                ? Image.network(path)
                : Image.file(File(path)),
        text == null ? Container() : Text(text!)
      ],
    );
  }

  Future<void> ocr() async {
    await getImageFromGallery();
    await encodeImage2Base64();
    // final recognizedTextList =
    //     prettierRecognizedText(await getRecognizedText());
    final recognizedTextList = [
      "petition",
      "O",
      "tragedy",
      "prejudice",
      "flaw",
      "Crisis",
      "exclusive",
      "evacuate",
      "apparent",
      "",
      "on Strike",
      "have struggled",
      "with",
      "bragged akont",
      "Contestant",
      "help onself to",
      "habitat",
      "medication",
      "instruction",
      "legislation",
      "Stubborn",
      "Conducting",
      "accumulate",
      "immune",
      "of ones choice",
      "resign",
      "beat around",
      "the bush",
      "tution fees",
      "from within",
      "appoint",
      "Massike",
      "o Squeeze",
      "erupt",
      "dozente",
      "emissions",
      "time off",
      "Specimens",
      "exhaust",
      "O",
      "real estate",
      "patents",
      "O",
      "unsettled",
      "regulute",
      "correction",
      "deforestation",
      "recession",
      "know A by heart",
      "Pop quizzes",
    ];
  }

  Future<void> getImageFromGallery() async {
    final image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = image;
      path = image!.path;
    });
  }

  Future<void> encodeImage2Base64() async {
    final imageBytes = await pickedImage!.readAsBytes();

    setState(() {
      imageBase64 = base64Encode(imageBytes);
    });
  }

  Future<String> getRecognizedText() async {
    // // TODO: shorten gv.~
    // final googleVision =
    //     await gv.GoogleVision.withJwt('./kenz-tools-f5507b94c0a6.json');

    // final image = gv.Image.fromBase64(imageBase64!);
    // final requests = gv.AnnotationRequests(
    //   requests: [
    //     gv.AnnotationRequest(
    //       image: image,
    //       features: [
    //         gv.Feature(
    //           maxResults: 10,
    //           type: 'DOCUMENT_TEXT_DETECTION',
    //         ),
    //       ],
    //     ),
    //   ],
    // );
    // final annotatedResponses = await googleVision.annotate(requests: requests);
    // print(annotatedResponses);
    // return '';

    final body = {
      'requests': [
        {
          'image': {'content': imageBase64},
          'features': [
            {'type': 'DOCUMENT_TEXT_DETECTION'},
          ],
        },
      ],
    };

    final http.Response res = await http.post(
      Uri.parse(
          'https://vision.googleapis.com/v1/images:annotate'), // TODO: hide key
      headers: {
        'Authorization':
            'Bearer ya29.c.b0Aaekm1IHQzIUozYeNVwv_MqqR7QwKFRHKaTSdS4ZsSo1Z9u4-A2tE0BmKL_9W9Ro9x_GZz7DWX5enhmbF7Viu3EtQyjGWjfL4JqgYu_YtKgVpAJOktkNG5LVNQ6Pn80L6n341dX4dY8DmrmG1cFOYqVOtlz-SYrGGvMCXcwRMOI1m_fDZn1wekr6C9GLm2xHOTjMLPMa38khQHUfIOQROL6Zfl-1hds6NlUz-wwaink',
        'x-goog-user-project': 'kenz-tools',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

    final visionData = Map.from(jsonDecode(utf8.decode(res.bodyBytes)));

    return visionData['responses'][0]['textAnnotations'][0]['description'];
  }

  String prettierRecognizedText(String recognizedText) {
    List<String> list = recognizedText.split('\n');
    list.asMap().forEach((key, value) {
      list[key] = value.replaceAll(RegExp('[^a-zA-Z0-9ㄱ-힣\\s]'), '');
      list[key] = list[key].replaceAll(RegExp('^\\s|\\s\$'), '');
    });
    return jsonEncode(list);
  }
}
