#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint vosk_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'libvosk'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :git => 'https://github.com/dkjazz/test' }

  s.platform = :ios, '11.0'

  # libvosk specific
  # telling CocoaPods not to remove framework
  s.preserve_paths = 'libvosk.xcframework/**/*'
  # telling linker to include framework & fix symbol not found when without use_framework!
  #s.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-framework libvosk -ObjC -all_load' }
  #s.user_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load' }
  # including framework
  s.vendored_frameworks = 'libvosk.xcframework'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
