import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomExitAppDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("CloseApp"),
      content: new Text("Are you sure ?"),
      actions: <Widget>[
        new FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: new Text("No"),
        ),
        new FlatButton(
          // onPressed: () => Navigator.of(context).pop(true),
          onPressed: () => SystemNavigator.pop(),
          child: new Text("Yes"),
        ),
      ],
    );
  }
}
