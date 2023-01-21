import 'package:flutter/material.dart';
import 'package:kenz_tools/screens/home/components/tools_list_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('켄즈 툴즈'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const ToolsListView(),
    );
  }
}
