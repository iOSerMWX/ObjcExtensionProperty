#
# Be sure to run `pod lib lint ObjcExtensionProperty.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ObjcExtensionProperty'
  s.version          = '2.0.2'
  s.summary          = 'Convenient objc getter/setter adding for classes and extensions'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Convenient objc getter/setter adding for classes and extensions.
                       DESC

  s.homepage         = 'https://github.com/Roen-Ro/ObjcExtensionProperty.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zxllf23@163.com' => 'zxllf23@163.com' }
  s.source           = { :git => 'https://github.com/Roen-Ro/ObjcExtensionProperty.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '3.0'
  
  s.source_files = 'ObjcExtensionProperty/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ObjcExtensionProperty' => ['ObjcExtensionProperty/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
 
end
