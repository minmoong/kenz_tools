const double kDefaultPadding = 20.0;

// Developer's constants
class Tool {
  String name;
  String desc;
  String usage;

  Tool(this.name, this.desc, this.usage);
}

final List<Tool> kenzTools = <Tool>[
  Tool(
    '영단어 OCR',
    '손글씨로 작성된 영단어들의 사진을 찍으면 단어들을 인식하여 클래스카드 앱 내 \'세트 > 만든 세트\' 항목으로 단어들을 옮겨줍니다.',
    '사용방법',
  ),
];
