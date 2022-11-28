import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_a_p_i/provider/todo_provider.dart';
import 'package:todo_app_a_p_i/widgets/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return TodoProvider();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
