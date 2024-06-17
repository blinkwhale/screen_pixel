#include "screen_pixel_plugin.h"
#include <flutter/method_call.h>
#include <flutter/standard_method_codec.h>
#include <gtest/gtest.h>

namespace {

TEST(ScreenPixelPlugin, GetPlatformVersion) {
  ScreenPixelPlugin plugin;
  auto method_call = std::make_unique<flutter::MethodCall<std::string>>(
      "getPlatformVersion", std::make_unique<flutter::EncodableValue>());
  auto result = std::make_unique<flutter::StandardMethodResult<std::string>>();
  plugin.HandleMethodCall(*method_call, std::move(result));
  EXPECT_EQ(result->result(), "Windows " + std::to_string(GetVersion()));
}

TEST(ScreenPixelPlugin, GetResolution) {
  ScreenPixelPlugin plugin;
  auto method_call = std::make_unique<flutter::MethodCall<std::string>>(
      "getResolution", std::make_unique<flutter::EncodableValue>());
  auto result = std::make_unique<flutter::StandardMethodResult<std::string>>();
  plugin.HandleMethodCall(*method_call, std::move(result));
  auto resolution = std::get<flutter::EncodableMap>(result->result());
  EXPECT_TRUE(resolution.find(flutter::EncodableValue("width")) != resolution.end());
  EXPECT_TRUE(resolution.find(flutter::EncodableValue("height")) != resolution.end());
}

}  // namespace
