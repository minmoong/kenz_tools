import 'package:flutter/material.dart';
import 'package:kenz_tools/constants.dart';
import 'package:kenz_tools/screens/details/tools_details_screen.dart';

class ToolsListItem extends StatelessWidget {
  const ToolsListItem({Key? key, required this.tool}) : super(key: key);

  final Tool tool;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tool.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ToolsDetailsScreen(
              tool: tool,
            ),
          ),
        );
      },
    );
  }
}
