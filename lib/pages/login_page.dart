import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true; // Флаг для определения режима (вход/регистрация)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isLogin
                ? [
                    DoDidDoneTheme.lightTheme.colorScheme.secondary,
                    DoDidDoneTheme.lightTheme.colorScheme.primary,
                  ]
                : [
                    DoDidDoneTheme.lightTheme.colorScheme.primary,
                    DoDidDoneTheme.lightTheme.colorScheme.secondary,
                  ],
            stops: const [0.1, 0.9], // Основной цвет занимает 90%
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Заголовок
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/_2.png',
                    height: 60,
                  ), // Assuming the image is in the 'assets/images' folder
                  const SizedBox(width:12),
                  
                  // Text('0codecaster', style: TextStyle(color: Colors.white))
                  const Text(
                    '0codecaster',
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'DO-',
                      style: TextStyle(
                        color: DoDidDoneTheme.lightTheme.colorScheme.primary,
                      ),
                    ),
                    const TextSpan(
                      text: 'DID-',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: 'DONE',
                      style: TextStyle(
                        color: DoDidDoneTheme.lightTheme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Поле логина
              TextField(
                decoration: InputDecoration(
                  hintText: 'Почта',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Поле пароля
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Пароль',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Поле "Повторить пароль" (только для регистрации)
              if (!isLogin)
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Повторить пароль',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              const SizedBox(height: 30),

              // Кнопка входа/регистрации
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isLogin
                      ? DoDidDoneTheme.lightTheme.colorScheme.primary
                      : DoDidDoneTheme.lightTheme.colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(isLogin ? 'Войти' : 'Зарегистрироваться'),
              ),
              const SizedBox(height: 20),

              // Кнопка перехода на другую страницу
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text(
                  isLogin
                      ? 'У меня еще нет аккаунта'
                      : 'Уже есть аккаунт',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import '../theme/theme.dart';
// import 'main_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool isLogin = true; // Флаг для определения режима (вход/регистрация)

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: isLogin
//                 ? [
//                     DoDidDoneTheme.lightTheme.colorScheme.secondary,
//                     DoDidDoneTheme.lightTheme.colorScheme.primary,
//                   ]
//                 : [
//                     DoDidDoneTheme.lightTheme.colorScheme.primary,
//                     DoDidDoneTheme.lightTheme.colorScheme.secondary,
//                   ],
//             stops: const [0.1, 0.9], // Основной цвет занимает 90%
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Заголовок
//               Text(
//                 isLogin ? 'Вход' : 'Регистрация',
//                 style: const TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 30),

//               // Поле логина
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Почта',
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.3),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Поле пароля
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   hintText: 'Пароль',
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.3),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Поле "Повторить пароль" (только для регистрации)
//               if (!isLogin)
//                 TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: 'Повторить пароль',
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.3),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//               const SizedBox(height: 30),

//               // Кнопка входа/регистрации
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const MainPage()));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: !isLogin
//                       ? DoDidDoneTheme.lightTheme.colorScheme.primary
//                       : DoDidDoneTheme.lightTheme.colorScheme.secondary,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 50,
//                     vertical: 15,
//                   ),
//                   textStyle: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//                 child: Text(isLogin ? 'Войти' : 'Зарегистрироваться'),
//               ),
//               const SizedBox(height: 20),

//               // Кнопка перехода на другую страницу
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     isLogin = !isLogin;
//                   });
//                 },
//                 child: Text(
//                   isLogin
//                       ? 'У меня еще нет аккаунта'
//                       : 'Уже есть аккаунт',
//                   style: const TextStyle(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
