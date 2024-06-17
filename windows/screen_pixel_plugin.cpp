#include "include/screen_pixel/screen_pixel_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>
#include <flutter/encodable_value.h>

#include <memory>
#include <sstream>

namespace screen_pixel {

// static
void ScreenPixelPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
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
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name().compare("getPlatformVersion") == 0) {
    std::ostringstream version_stream;
    version_stream << "Windows ";
    if (IsWindows10OrGreater()) {
      version_stream << "10+";
    } else if (IsWindows8OrGreater()) {
      version_stream << "8";
    } else if (IsWindows7OrGreater()) {
      version_stream << "7";
    }
    result->Success(flutter::EncodableValue(version_stream.str()));
  } else if (method_call.method_name().compare("getResolution") == 0) {
        // Get screen resolution.
        RECT desktop;
        const HWND hDesktop = GetDesktopWindow();
        GetWindowRect(hDesktop, &desktop);
        int width = desktop.right;
        int height = desktop.bottom;

        flutter::EncodableMap resolution;
        resolution[flutter::EncodableValue("width")] = flutter::EncodableValue(static_cast<double>(width));
        resolution[flutter::EncodableValue("height")] = flutter::EncodableValue(static_cast<double>(height));
        result->Success(flutter::EncodableValue(resolution));
  } else {
    result->NotImplemented();
  }
}
}  // namespace screen_pixel
