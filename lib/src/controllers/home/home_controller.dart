import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolistpf/src/bd/task.dart';
import 'package:todolistpf/src/controllers/home/navigationBarOption/add_task_controller.dart';
import 'package:todolistpf/src/interface/home/home_interface.dart';
import 'package:todolistpf/src/models/task_model.dart';

class HomeController extends GetxController {
  RxInt menuTaskProject = 0.obs;
  RxList<TaskModel> _activeTask = <TaskModel>[].obs;
  RxList<TaskModel> _inactiveTask = <TaskModel>[].obs;

  /* RxList<TaskModel> _activeTask = <TaskModel>[
    TaskModel(
        id: '0',
        title: 'Toca el botón de "mas" para añadir una nueva tarea',
        date: DateTime(2022, 12, 21)),
  ].obs;
  RxList<TaskModel> _inactiveTask = <TaskModel>[
    TaskModel(
      id: '1',
      title: 'TodoList PF',
      date: DateTime(2022, 12, 19),
      project: 'Te damos la ¡Bienvenida!',
      colorProject: Colors.grey,
    ),
  ].obs; */
  @override
  void onInit() {
    super.onInit();
  }

  initTask() {
    for (var task in tasks) {
      if (task.date.year <= DateTime.now().year &&
          task.date.month <= DateTime.now().month &&
          task.date.day < DateTime.now().day) {
        _inactiveTask.add(task);
      } else {
        _activeTask.add(task);
      }
    }
  }

  /*  @override
  void onReady() {
    Get.put(() => AddTaskController());
    super.onReady();
  } */

  int activeTaskLength() => _activeTask.length;
  int inactiveTaskLength() => _inactiveTask.length;
  /* deleteTask(String id){
    _activeTask.
    for (var element in collection) {
      
    }
  } */
  Map activeTask(int index) {
    return {
      'id': _activeTask[index].id,
      'title': _activeTask[index].title,
      'description': _activeTask[index].description,
      'date': _activeTask[index].date,
      'project': _activeTask[index].project,
      'colorProject': _activeTask[index].colorProject,
    };
  }

  Map inactiveTask(int index) {
    return {
      'id': _inactiveTask[index].id,
      'title': _inactiveTask[index].title,
      'description': _inactiveTask[index].description,
      'date': _inactiveTask[index].date,
      'project': _inactiveTask[index].project,
      'colorProject': _inactiveTask[index].colorProject,
    };
  }

  deleteActiveTask(String id) {
    _activeTask.removeWhere((task) {
      if (task.id == id) {
        return true;
      } else {
        return false;
      }
    });
    bdDeleteTask(id);
    update();
  }

  deleteInactiveTask(String id) {
    _inactiveTask.removeWhere((task) {
      if (task.id == id) {
        return true;
      } else {
        return false;
      }
    });
    bdDeleteTask(id);
    update();
  }

  bdDeleteTask(String id) {
    tasks.removeWhere((task) {
      if (task.id == id) {
        return true;
      } else {
        return false;
      }
    });
  }

  selectOptionTaskProject() {
    if (menuTaskProject == 0) return Text('Hoy');
    if (menuTaskProject == 1) return Text('Esta Semana');
    if (menuTaskProject == 2) return Text('Estes mes');
  }

  selectOptionNavigatorBar(BuildContext context, int index,
      {MainAxisSize? mainAxisSize}) {
    if (index == 0) return ModalButtonSheet.menu(context);
    if (index == 1) return ModalButtonSheet.add(context);
    if (index == 2) return ModalButtonSheet.search(context);
    if (index == 3) return ModalButtonSheet.notifications(context);
  }
}
