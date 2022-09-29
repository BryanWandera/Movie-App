import 'package:flutter/material.dart';
import 'screens/ListViewScreen.dart';
import 'screens/SearchScreen.dart';
import 'screens/ViewScreen.dart';
import 'package:movie_app/utilities/api_handler.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        child: MaterialApp(
            title: 'Flutter Demo',
            initialRoute: 'screens/ListViewScreen.dart',

            routes: {
              'screens/ListViewScreen.dart' : (context)=> ListViewScreen(),
              'screens/ViewScreen.dart' : (context) => ViewScreen(),
              'screens/SearchScreen.dart' : (context) => SearchScreen()
            },
            theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white
            ),
            home:  ListViewScreen()
        ),
        providers: [
          ChangeNotifierProvider(create: (_)=>MovieProvider())
    ]);
      

  }
}




