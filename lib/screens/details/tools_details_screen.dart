import 'package:flutter/material.dart';
import 'package:gitpod_flutter_quickstart/constants.dart';

class ToolsDetailsScreen extends StatelessWidget {
  const ToolsDetailsScreen({Key? key, required this.tool}) : super(key: key);

  final Tool tool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tool.name),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tool.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              tool.desc,
              style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
