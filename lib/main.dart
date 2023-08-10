import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_reservation_app/%20cache/cacheHelper.dart';
import 'package:resto_reservation_app/models/ReservationProvider.dart';
import 'package:resto_reservation_app/models/user.dart';
import 'package:resto_reservation_app/pages/welcome_page.dart';
import 'pages/login_page.dart';
import 'pages/registration_page.dart';

main(){
  WidgetsFlutterBinding.ensureInitialized();
  cacheData.cacheInitialization();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => User()),
        ChangeNotifierProvider(create: (_) => ReservationProvider()),
      ],
      child: const MaterialApp(home: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}


// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange,
//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("assets/intro.png"),
//                       ),
//                     ),
//                   ),
//                   const Text(
//                     'WELCOME',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 70,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'Welcome to our restaurant, we are pleased to serve you and don\'t forget to '
//                     'book your reservation now! ',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 25, color: Colors.grey.shade700),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20.0),
//                         child: MaterialButton(
//                           textColor: Colors.black,
//                           color: Colors.yellow,
//                           minWidth: double.infinity,
//                           height: 60,
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const LoginPage()));
//                           },
//                           shape: RoundedRectangleBorder(
//                               side: const BorderSide(color: Colors.deepOrange),
//                               borderRadius: BorderRadius.circular(50)),
//                           child: const Text(
//                             'Login',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20.0),
//                         child: MaterialButton(
//                           textColor: Colors.black,
//                           color: Colors.deepOrange,
//                           minWidth: double.infinity,
//                           height: 60,
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const RegistrationPage()));
//                           },
//                           shape: RoundedRectangleBorder(
//                               side: const BorderSide(color: Colors.yellow),
//                               borderRadius: BorderRadius.circular(50)),
//                           child: const Text(
//                             'Register',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
