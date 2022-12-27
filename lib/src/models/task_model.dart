import 'package:flutter/material.dart';

class TaskModel {
  String id;
  String title;
  String? description;
  DateTime date;
  String? project;
  Color? colorProject;
  TaskModel(
      {required this.id,
      required this.title,
      this.description,
      required this.date,
      this.project,
      this.colorProject});
}
