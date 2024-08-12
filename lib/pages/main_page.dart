import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/all_tasks.dart';
import '../screens/profile.dart'; // Импортируем страницу профиля
import '../theme/theme.dart'; // Импортируем файл с темой

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Список виджетов для каждой вкладки
  static List<Widget> _widgetOptions = <Widget>[
    TasksPage(),
    Text('Сегодня'),
    Text('Выполнено'),
    ProfilePage(), // Заменяем Text на ProfilePage
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Функция для открытия диалогового окна
  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String _title = '';
        String _description = '';
        DateTime _deadline = DateTime.now();

        return AlertDialog(
          title: const Text('Добавить задачу'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Название задачи'),
                onChanged: (value) {
                  _title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Описание задачи'),
                onChanged: (value) {
                  _description = value;
                }
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDateTimePicker(context, _deadline).then((pickedDateTime) {
                      if (pickedDateTime != null) {
                        setState(() {
                          _deadline = pickedDateTime;
                        });
                      }
                    });
                  },
                  child: Text('Выбрать дату и время: ${DateFormat('dd.MM.yy HH:mm').format(_deadline)}'),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Добавить'),                
            ),
          ]
        );
      },
    );
  }

  // Функция для показа диалогового окна выбора даты и времени
  Future<DateTime?> showDateTimePicker(BuildContext context, DateTime initialDate) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ).then((pickedDate) {
      if (pickedDate == null) return null;

      return showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(pickedDate),
      ).then((pickedTime) {
        if (pickedTime == null) return null;

        return DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Убираем тень
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              DoDidDoneTheme.lightTheme.colorScheme.secondary,
              DoDidDoneTheme.lightTheme.colorScheme.primary,
            ],
            stops: const [0.1, 0.9], // Основной цвет занимает 90%
          ),
        ),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Задачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Сегодня',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Выполнено',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // backgroundColor: DoDidDoneTheme.lightTheme.colorScheme.primary, // Цвет фона из темы
        selectedItemColor: DoDidDoneTheme.lightTheme.colorScheme.primary, // Цвет выбранного элемента из темы
        unselectedItemColor: DoDidDoneTheme.lightTheme.colorScheme.secondary.withOpacity(0.5), // Цвет невыбранного элемента из темы
        // Добавляем тему для BottomNavigationBar
        type: BottomNavigationBarType.fixed,
        // Дополнительные стили для иконок
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // ...
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
