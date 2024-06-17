#ifndef FLUTTER_PLUGIN_SCREEN_PIXEL_PLUGIN_H_
#define FLUTTER_PLUGIN_SCREEN_PIXEL_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace {

class ScreenPixelPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ScreenPixelPlugin();

  virtual ~ScreenPixelPlugin();

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<std::string> &method_call,
      std::unique_ptr<flutter::MethodResult<std::string>> result);
};

}  // namespace

#endif  // FLUTTER_PLUGIN_SCREEN_PIXEL_PLUGIN_H_
