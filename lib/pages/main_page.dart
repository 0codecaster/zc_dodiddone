import 'package:flutter/material.dart';
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
  final List<Widget> _widgetOptions = <Widget>[
    Text('Задачи'),
    Text('Сегодня'),
    ProfilePage(), // Заменяем Text на ProfilePage
    Text('Выполнено'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Выполнено',
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
    );
  }
}



/* import 'package:flutter/material.dart';
import '../theme/theme.dart'; // Импортируем файл с темой

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Задачи'),
    Text('Сегодня'),
    Text('Профиль'),
    Text('Выполнено'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
            icon: Icon(Icons.task_alt),
            label: 'Задачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Сегодня',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Выполнено',
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
    );
  }
}
 */