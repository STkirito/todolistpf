import 'package:awesonestyle/awesonestyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

import 'package:todolistpf/src/controllers/home/home_controller.dart';
import 'package:todolistpf/src/controllers/home/navigationBarOption/add_task_controller.dart';
import 'package:todolistpf/src/interface/shared/item_task.dart';
import 'package:todolistpf/src/interface/shared/keyboard_visibility.dart';

class HomeInterface extends StatefulWidget {
  const HomeInterface({super.key});

  @override
  State<HomeInterface> createState() => _HomeInterfaceState();
}

class _HomeInterfaceState extends State<HomeInterface> {
  late HomeController controller;
  @override
  void initState() {
    controller = Get.put(HomeController());
    controller.initTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: controller.selectOptionTaskProject(),
        actions: [
          CupertinoButton(
              child: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),
      body: const _Task(),
      bottomNavigationBar: _NavigatorBar(),
    );
  }
}

class _Task extends GetView {
  const _Task();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AwsScreenSize.height(100),
      width: AwsScreenSize.width(100),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: AwsScreenSize.height(100),
          width: AwsScreenSize.width(100),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Vencidas'),
                  CupertinoButton(
                      child: const Text('Reprogramar'), onPressed: () {}),
                ],
              ),
              const _DueTasks(),
              const Align(
                  alignment: Alignment.bottomLeft, child: Text('Activas')),
              const _ActiveTasks(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DueTasks extends GetView {
  const _DueTasks();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      if (controller.inactiveTaskLength() == 0) {
        return Container();
      } else {
        return ListView.builder(
            itemCount: controller.inactiveTaskLength(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemTask(
                title: controller.inactiveTask(index)['title'],
                description: controller.inactiveTask(index)['description'],
                date: controller.inactiveTask(index)['date'],
                project: controller.inactiveTask(index)['project'],
                colorProject: controller.inactiveTask(index)['colorProject'],
                checkoOnChanged: (value) {
                  if (value == true) {
                    controller.deleteInactiveTask(
                        controller.inactiveTask(index)['id']);
                  }
                  print('check: $value');
                },
              );
            });
      }
    });
  }
}

class _ActiveTasks extends GetView {
  const _ActiveTasks();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      if (controller.activeTaskLength() == 0) {
        return Container();
      } else {
        return ListView.builder(
            itemCount: controller.activeTaskLength(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemTask(
                title: controller.activeTask(index)['title'],
                description: controller.activeTask(index)['description'],
                date: controller.activeTask(index)['date'],
                project: controller.activeTask(index)['project'],
                colorProject: controller.activeTask(index)['colorProject'],
                checkoOnChanged: (value) {
                  if (value == true) {
                    controller
                        .deleteActiveTask(controller.activeTask(index)['id']);
                  }
                  print('check: $value');
                },
              );
            });
      }
    });
  }
}

class _NavigatorBar extends GetView<HomeController> {
  const _NavigatorBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleNavBar(
      activeIcons: [
        Icon(Icons.menu, color: Colors.deepPurpleAccent),
        CupertinoButton(
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              controller.selectOptionNavigatorBar(context, 1);
            }),
        Icon(Icons.search, color: Colors.deepPurpleAccent),
        Icon(Icons.notifications_rounded, color: Colors.deepPurpleAccent),
      ],
      inactiveIcons: const [
        Icon(Icons.menu, color: Colors.white),
        Icon(Icons.add, color: Colors.white),
        Icon(Icons.search, color: Colors.white),
        Icon(Icons.notifications_rounded, color: Colors.white),
      ],
      color: Colors.white,
      circleColor: Colors.white,
      height: 60,
      circleWidth: 60,
      onTap: (index) => controller.selectOptionNavigatorBar(context, index),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
      ),
      shadowColor: Colors.deepPurple,
      circleShadowColor: Colors.deepPurple,
      elevation: 10,
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.blue, Colors.red],
      ),
      circleGradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.blue, Colors.red],
      ),
      activeIndex: 1,
    );
  }
}

class ModalButtonSheet {
  static Future menu(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.share),
                title: new Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  static Future add(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return GetBuilder<AddTaskController>(
              init: Get.put(AddTaskController()),
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: controller.mainAxisSize.value,
                    children: [
                      TextField(
                        controller: controller.title,
                        decoration: InputDecoration(
                          label: Text('Nombre de la Tarea'),
                          border: InputBorder.none,
                        ),
                        onTap: () =>
                            controller.mainAxisSize.value = MainAxisSize.max,
                        onSubmitted: (_) =>
                            controller.mainAxisSize.value = MainAxisSize.min,
                      ),
                      TextField(
                        controller: controller.description,
                        decoration: InputDecoration(
                          label: Text('Descripción'),
                          border: InputBorder.none,
                        ),
                        onTap: () =>
                            controller.mainAxisSize.value = MainAxisSize.max,
                        onSubmitted: (_) =>
                            controller.mainAxisSize.value = MainAxisSize.min,
                      ),
                      SizedBox(
                        height: AwsScreenSize.height(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: GestureDetector(
                                    child: Text(controller.dateString()),
                                    onTap: () async {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            /* controller.date.value =
                                                DateTime.now(); */
                                            return AwsDatePicker(
                                              day: DateSettings(
                                                  initialLabel: 'D',
                                                  label: controller
                                                      .dateLabel()['day'],
                                                  styleInitial: TextStyle(
                                                      color: Colors.black),
                                                  styleLabel: TextStyle(
                                                      color: Colors.black),
                                                  length: 31),
                                              month: DateSettings(
                                                  initialLabel: 'M',
                                                  label: controller
                                                      .dateLabel()['month'],
                                                  styleInitial: TextStyle(
                                                      color: Colors.black),
                                                  styleLabel: TextStyle(
                                                      color: Colors.black),
                                                  length: 12),
                                              year: DateSettings(
                                                  initialLabel: 'Y',
                                                  label: controller
                                                      .dateLabel()['year'],
                                                  styleInitial: TextStyle(
                                                      color: Colors.black),
                                                  styleLabel: TextStyle(
                                                      color: Colors.black),
                                                  year: true),
                                              onSelectedDateChanged: (d, m, y) {
                                                // _access.date.value = Date(d, m, y);
                                                controller.date.value =
                                                    DateTime(
                                                        int.parse(y.isEmpty
                                                            ? DateTime.now()
                                                                .year
                                                                .toString()
                                                            : y),
                                                        int.parse(m.isEmpty
                                                            ? DateTime.now()
                                                                .month
                                                                .toString()
                                                            : m),
                                                        int.parse(d.isEmpty
                                                            ? DateTime.now()
                                                                .day
                                                                .toString()
                                                            : d));

                                                print('Fecha: $d-$m-$y');
                                              },
                                            );
                                          });
                                      /* Get.bottomSheet(
                                        AwsDatePicker(
                                          day: DateSettings(label: '21'),
                                          month: DateSettings(label: '12'),
                                          year: DateSettings(
                                            label: '2022',
                                            year: true,
                                          ),
                                          onSelectedDateChanged: (d, m, y) {
                                            print('$d-$m-$y');
                                          },
                                        ),
                                      ); */
                                    },
                                  ),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: GestureDetector(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.priority_high),
                                        SizedBox(width: 2),
                                        Text('Prioridad'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CupertinoButton(
                                child: Icon(Icons.send), onPressed: () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

/*   static Future add(BuildContext context) {
    Rx<MainAxisSize> _mainAxisSize = MainAxisSize.min.obs;
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Obx(() {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: _mainAxisSize.value,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      label: Text('Nombre de la Tarea'),
                      border: InputBorder.none,
                    ),
                    onTap: () => _mainAxisSize.value = MainAxisSize.max,
                    onSubmitted: (_) => _mainAxisSize.value = MainAxisSize.min,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text('Descripción'),
                      border: InputBorder.none,
                    ),
                    onTap: () => _mainAxisSize.value = MainAxisSize.max,
                    onSubmitted: (_) => _mainAxisSize.value = MainAxisSize.min,
                  ),
                  SizedBox(
                    height: AwsScreenSize.height(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: GestureDetector(child: Text('Hoy')),

                            ),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: GestureDetector(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.priority_high),
                                    SizedBox(width: 2),
                                    Text('Prioridad'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        CupertinoButton(
                            child: Icon(Icons.send), onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  } */

  static Future search(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.share),
                title: new Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  static Future notifications(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.share),
                title: new Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
