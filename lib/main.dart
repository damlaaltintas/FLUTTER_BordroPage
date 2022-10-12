import 'package:bordro_page/view/bordro_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bordrolarım Sayfası',
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          leading: IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.arrow_back)),
          title:
          Text('Bordrolarım'),
        ),
        body: bordro_home_page()
        ),
    );
  }
}
