#
#  Be sure to run `pod spec lint NoExceptions.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name = "NoExceptions"
  spec.version = "0.0.2"
  spec.summary = "This is a library that provides the ability for Swift code to catch an `NSException`"
  spec.description = <<-DESC
  This is a library that provides the ability for Swift code to catch an `NSException`.

  This is useful since the standard `try` and `catch` mechanism provided by Swift will not capture an `NSException` thrown from Objective-C.
                   DESC

  spec.homepage = "https://github.com/joesus/NoExceptions"
  spec.license = "MIT"
  spec.authors = { "joesus" => "joesusnick@gmail.com",
                   "samodom" => "samodom@icloud.com" }
  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.9"
  spec.source = { :git => "https://github.com/joesus/NoExceptions.git", :tag => "v#{spec.version}" }
  spec.source_files = "NoExceptions/*.{h,m,swift}"
  spec.swift_version = '5.0'
  spec.requires_arc = true
end
