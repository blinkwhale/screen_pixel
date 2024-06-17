#include "include/screen_pixel/screen_pixel_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "screen_pixel_plugin.h"

void ScreenPixelPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  screen_pixel::ScreenPixelPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
