import 'package:flutter/material.dart';
import 'package:todolistpf/src/models/task_model.dart';

List<TaskModel> tasks = [
  TaskModel(
      id: '0',
      title: 'Toca el botón de "mas" para añadir una nueva tarea',
      date: DateTime(2022, 12, 21)),
  TaskModel(
    id: '1',
    title: 'TodoList PF',
    date: DateTime(2022, 12, 19),
    project: 'Te damos la ¡Bienvenida!',
    colorProject: Colors.grey,
  ),
];
