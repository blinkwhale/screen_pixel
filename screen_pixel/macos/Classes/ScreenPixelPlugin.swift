import Cocoa
import FlutterMacOS

public class ScreenPixelPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "screen_pixel", binaryMessenger: registrar.messenger)
    let instance = ScreenPixelPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if (call.method == "getResolution") {
        if let screen = NSScreen.main {
          let width = screen.frame.width
          let height = screen.frame.height
          result("\(width) x \(height)")
        } else {
          result(FlutterError(code: "UNAVAILABLE", message: "Screen info unavailable", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
}
