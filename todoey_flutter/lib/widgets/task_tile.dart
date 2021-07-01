import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool ischecked;
  final void Function(bool?) checkboxcallback;
  final void Function() onlongpresscallback;
  final String tasktitle;

  TaskTile(this.tasktitle, this.ischecked, this.checkboxcallback,this.onlongpresscallback);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onlongpresscallback,
      title: Text(
        tasktitle,
        style: TextStyle(
            decoration: ischecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: ischecked,
        onChanged: checkboxcallback,
      ),
    );
  }
}
