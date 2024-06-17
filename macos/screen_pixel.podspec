#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint screen_pixel.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'screen_pixel'
  s.version          = '0.0.3'
  s.summary          = 'A Flutter plugin to get screen resolution on macOS.'
  s.description      = <<-DESC
A Flutter plugin to get screen resolution on macOS.
                       DESC
  s.homepage         = 'https://github.com/blinkwhale/screen_pixel'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
