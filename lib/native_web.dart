import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

typedef void WebViewCreatedCallback(WebController controller);

/// Виджет просмотра веб-страниц
class NativeWeb extends StatefulWidget {
  final WebViewCreatedCallback onWebCreated;

  NativeWeb({
    Key key,
    @required this.onWebCreated,
  });

  @override
  _NativeWebState createState() => _NativeWebState();
}

class _NativeWebState extends State<NativeWeb> {
  @override
  Widget build(BuildContext context) {
    /// В зависимости от платформы возвращает виджет, который
    /// обеспечивает отображение нативных компонентов
    if(defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'nativeweb',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if(defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'nativeweb',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return new Text('Платформа $defaultTargetPlatform не поддерживает!');
  }

  /// Выполняется при создании нативного просмотрщика
  Future<void> onPlatformViewCreated(id) async {
    if (widget.onWebCreated == null) return;
    widget.onWebCreated(new WebController.init(id));
  }
}

/// Контроллер просмотрщика
class WebController {
  MethodChannel _channel;

  WebController.init(int id) {
    _channel =  new MethodChannel('nativeweb_$id');
  }

  /// Инициализация загрузки веб-страницы
  Future<void> loadUrl(String url) async {
    assert(url != null);
    return _channel.invokeMethod('loadUrl', url);
  }
}
