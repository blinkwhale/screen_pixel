import Cocoa
import FlutterMacOS
import XCTest

@testable import screen_pixel

class RunnerTests: XCTestCase {
  func testGetResolution() {
    let plugin = ScreenPixelPlugin()

    let call = FlutterMethodCall(methodName: "getResolution", arguments: nil)

    let resultExpectation = expectation(description: "result block must be called.")
    plugin.handle(call) { result in
      if let resolution = result as? [String: Double],
         let width = resolution["width"],
         let height = resolution["height"] {
        XCTAssertTrue(width > 0, "Width should be greater than 0")
        XCTAssertTrue(height > 0, "Height should be greater than 0")
      } else {
        XCTFail("Result should be a dictionary with width and height")
      }
      resultExpectation.fulfill()
    }
    waitForExpectations(timeout: 1)
  }
}
