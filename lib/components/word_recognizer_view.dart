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
    final String recognizedText = await getRecognizedText();

    // 감지된 텍스트 다듬기
    print(prettierRecognizedText(recognizedText));
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
            'Bearer ya29.c.b0AT7lpjCA2xAcTTb3Ja0XulxIQgWKXl1K0d7RPFD0nQWWSnNKbhxpEYHg8JsbDYXukxSuVObJxJ979ykKtWYOwh9ezwKFApH5vEKUVGFTX1t0KnSZ9gFqtBlzQTpajNm9xyfWTdMy1f6Lo5wzwF99suw9hvWjTtrHmj4Zh4ziS69RfyloxXsQm09mpJxlPjVe6U9z5P6sFbxRA3O_seRQxnA38Mo9PiD1P6OUvkJleTo',
        'x-goog-user-project': 'kenz-tools',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

    final visionData = Map.from(jsonDecode(utf8.decode(res.bodyBytes)));

    return visionData['responses'][0]['textAnnotations'][0]['description'];
  }

  List<String> prettierRecognizedText(String recognizedText) {
    List<String> list = recognizedText.split('\n');
    list.asMap().forEach((key, value) {
      list[key] = value.replaceAll(RegExp('[^a-zA-Z0-9ㄱ-힣\\s]'), '');
    });
    return list;
  }
}
