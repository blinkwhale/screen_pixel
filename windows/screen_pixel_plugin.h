#ifndef FLUTTER_PLUGIN_SCREEN_PIXEL_PLUGIN_H_
#define FLUTTER_PLUGIN_SCREEN_PIXEL_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace screen_pixel {

class ScreenPixelPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ScreenPixelPlugin();

  virtual ~ScreenPixelPlugin();

 private:
  void HandleMethodCall(
      const flutter::MethodCall<std::string> &method_call,
      std::unique_ptr<flutter::MethodResult<std::string>> result);
};

}  // namespace screen_pixel

#endif  // FLUTTER_PLUGIN_SCREEN_PIXEL_PLUGIN_H_
