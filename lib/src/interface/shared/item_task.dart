import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/material.dart';

class ItemTask extends GetView {
  RxBool _selectTask = false.obs;
  void Function(bool?)? checkoOnChanged;
  String title;
  List<InlineSpan>? childrenTitle;
  String? description;
  DateTime date;
  String? project;
  Color? colorProject;
  ItemTask(
      {this.checkoOnChanged,
      required this.title,
      this.childrenTitle,
      this.description,
      required this.date,
      this.project,
      this.colorProject,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        ListTile(
          leading: Obx(
            () => Checkbox(
              value: _selectTask.value,
              onChanged: (value) {
                _selectTask.value = !_selectTask.value;
                checkoOnChanged?.call(value);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  children: childrenTitle,
                ),
              ),
              if (description == null) ...[
                SizedBox(
                  height: 10,
                ),
              ],
              if (description != null) ...[
                SizedBox(
                  height: 10,
                ),
                Text(
                  description ?? '',
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                AwsFormatter.formatter.format(date) ==
                        AwsFormatter.formatter.format(DateTime.now())
                    ? 'Hoy'
                    : AwsFormatter.formatter.format(date),
              ),
              SizedBox(
                width: 50,
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        project ?? '',
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: colorProject,
                          borderRadius: BorderRadius.circular(60)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
