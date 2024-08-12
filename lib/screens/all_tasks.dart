import 'package:flutter/material.dart';

import '../widgets/task_item.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  // Список задач (замените на реальные данные)
  final List<String> _tasks = [
    'Заказать в Озоне ватные палочки',
    'Заказать в Озоне печеньки',
    'Заняться тетрисом в гараже',
    'Прикинуть схему стеллажа на месте',
    'Проверить код main_page',
    'Проверить поступление заказа'
  ];

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return TaskItem(
            title: _tasks[index],
            description: 'Описание задачи',
            deadline: DateTime.now(),
          );
        },
      );
  }
}
