import 'package:flutter/material.dart';
import 'package:kenz_tools/components/word_recognizer_view.dart';

const double kDefaultPadding = 20.0;

// Developer's constants
class Tool {
  String name;
  String desc;
  String usage;
  Widget function;

  Tool(this.name, this.desc, this.usage, this.function);
}

final List<Tool> kenzTools = <Tool>[
  Tool(
    '영단어 OCR',
    '손글씨로 작성된 영단어들의 사진을 찍으면 단어들을 인식하여 클래스카드 앱 내 \'세트 > 만든 세트\' 항목으로 단어들을 옮겨줍니다.',
    '사용방법',
    WordRecognizerView(),
  ),
];
