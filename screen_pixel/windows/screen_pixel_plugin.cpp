#include "screen_pixel_plugin.h"

#include <flutter/plugin_registrar_windows.h>
#include <windows.h>

#include <memory>
#include <sstream>

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

// static
void ScreenPixelPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel = std::make_unique<flutter::MethodChannel<std::string>>(
      registrar->messenger(), "screen_pixel",
      &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<ScreenPixelPlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

ScreenPixelPlugin::ScreenPixelPlugin() {}

ScreenPixelPlugin::~ScreenPixelPlugin() {}

void ScreenPixelPlugin::HandleMethodCall(
    const flutter::MethodCall<std::string> &method_call,
    std::unique_ptr<flutter::MethodResult<std::string>> result) {
  if (method_call.method_name().compare("getResolution") == 0) {
    // Get screen resolution.
    RECT desktop;
    const HWND hDesktop = GetDesktopWindow();
    GetWindowRect(hDesktop, &desktop);
    int width = desktop.right;
    int height = desktop.bottom;

    std::ostringstream resolution_stream;
    resolution_stream << "{"
                      << "\"width\":" << width << ","
                      << "\"height\":" << height
                      << "}";

    result->Success(resolution_stream.str());
  } else {
    result->NotImplemented();
  }
}

}  // namespace

void ScreenPixelPluginRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  ScreenPixelPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
