#include <flutter/method_call.h>
#include <flutter/method_result_functions.h>
#include <flutter/standard_method_codec.h>
#include <gtest/gtest.h>
#include <windows.h>

#include <memory>
#include <string>
#include <variant>

#include "screen_pixel_plugin.h"

namespace screen_pixel {
namespace test {

namespace {

using flutter::EncodableMap;
using flutter::EncodableValue;
using flutter::MethodCall;
using flutter::MethodResultFunctions;

}  // namespace

TEST(ScreenPixelPlugin, GetPlatformVersion) {
  ScreenPixelPlugin plugin;
  // Save the reply value from the success callback.
  std::string result_string;
  plugin.HandleMethodCall(
      MethodCall("getPlatformVersion", std::make_unique<EncodableValue>()),
      std::make_unique<MethodResultFunctions<>>(
          [&result_string](const EncodableValue* result) {
            result_string = std::get<std::string>(*result);
          },
          nullptr, nullptr));

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

}  // namespace test
}  // namespace screen_pixel
