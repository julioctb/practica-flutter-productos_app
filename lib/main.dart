import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

void main() => runApp( AppState());

// ignore: use_key_in_widget_constructors
class AppState extends StatelessWidget {
  
    @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => ProductsService()),
      ],
      child: const MyApp(),
      );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'detail_product': (_) => ProductDetail(),
      },
      theme:ThemeData(
             scaffoldBackgroundColor: Colors.grey[300],
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.indigo,
                elevation: 0,),
                //textTheme: GoogleFonts.dmSansTextTheme(),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.indigo,
                  elevation: 0
                ),
      )
    );
  }
}
