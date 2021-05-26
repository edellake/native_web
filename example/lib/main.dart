import 'package:flutter/material.dart';
import 'package:native_web/native_web.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WebController webController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Виджет просмотра веб-страниц
    NativeWeb nativeWeb = new NativeWeb(
      onWebCreated: onWebCreated,
    );

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Пример приложения-плагина'),
          ),
          body: Container(
            child: nativeWeb,
            height: 300.0,
          )
      ),
    );
  }

  /// Будет выполняться при виджета просмотра веб-страниц
  void onWebCreated(webController) {
    this.webController = webController;
    this.webController.loadUrl("https://sokolov.ru/");
  }
}
