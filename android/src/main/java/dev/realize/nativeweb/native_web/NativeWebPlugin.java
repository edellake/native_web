package dev.realize.nativeweb.native_web;

import io.flutter.plugin.common.PluginRegistry.Registrar;

/** NativeWebPlugin */
public class NativeWebPlugin {

  /** Регистрация ViewFactory */
  public static void registerWith(Registrar registrar) {
    registrar
            .platformViewRegistry()
            .registerViewFactory(
                    "nativeweb", new WebFactory(registrar));
  }
}
