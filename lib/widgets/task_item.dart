import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Импортируем пакет intl для форматирования даты

class TaskItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime deadline;

  const TaskItem({
    Key? key,
    required this.title,
    required this.description,
    required this.deadline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Форматируем дату и время
    String formattedDeadline = DateFormat('dd.MM.yy HH:mm').format(deadline);

    // Определяем срочность задачи
    Duration timeUntilDeadline = deadline.difference(DateTime.now());
    Color gradientStart;
    if (timeUntilDeadline.inDays < 1) {
      gradientStart = Colors.red; // срочная
    } else if(timeUntilDeadline.inDays < 2) {
      gradientStart = Colors.yellow; // средняя срочность
    } else {
      gradientStart = Colors.green; // несрочная
    }

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [gradientStart, Colors.white],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Обработка нажатия на кнопку "Редактировать"
                    // Например, можно открыть диалог редактирования задачи
                    print('Редактировать задачу');
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    // Обработка нажатия на кнопку "Удалить"
                    // Например, можно показать диалог подтверждения удаления
                    print('Удалить задачу');
                  },
                  icon: const Icon(Icons.delete),
                ),                
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  'Дедлайн: $formattedDeadline', // Используем отформатированную дату
                  style: const TextStyle(fontSize: 14),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
