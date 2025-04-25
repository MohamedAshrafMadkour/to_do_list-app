import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/styles.dart';
import 'package:to_do_list_app/feature/home/data/model/task_model.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({super.key, required this.task});
  final TaskModel task;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isCheck,
      onChanged: (val) {
        setState(() {
          isCheck = val!;
        });
      },
      activeColor: const Color(0xff55847A),
      title:
          isCheck
              ? Text(
                widget.task.task,
                style: Styles.textMedium15.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.double,
                ),
              )
              : Text(widget.task.task, style: Styles.textMedium15),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}
