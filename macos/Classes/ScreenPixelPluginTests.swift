import Cocoa
import FlutterMacOS
import XCTest

@testable import screen_pixel

class ScreenPixelPluginTests: XCTestCase {
  func testGetResolution() {
    let plugin = ScreenPixelPlugin()
    let call = FlutterMethodCall(methodName: "getResolution", arguments: [])
    let resultExpectation = expectation(description: "result block must be called.")

    plugin.handle(call) { result in
      if let resolution = result as? [String: Double] {
        XCTAssertNotNil(resolution["width"])
        XCTAssertNotNil(resolution["height"])
        resultExpectation.fulfill()
      } else {
        XCTFail("Expected resolution dictionary")
      }
    }

    waitForExpectations(timeout: 1)
  }
}
