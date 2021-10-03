
import 'package:blocstudy/DataModel/error_catcher.dart';
import 'package:flutter/cupertino.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Failed to Load data." + ErrorCatcher.getError()),
    );
  }
}