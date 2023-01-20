import 'package:flutter/material.dart';
import 'package:gitpod_flutter_quickstart/constants.dart';
import 'package:gitpod_flutter_quickstart/screens/home/components/tools_list_item.dart';

class ToolsListView extends StatelessWidget {
  const ToolsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kenzTools.length,
      itemBuilder: (context, index) {
        return ToolsListItem(tool: kenzTools[index]);
      },
    );
  }
}
