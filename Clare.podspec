#
# Be sure to run `pod lib lint Clare.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Clare'
  s.version          = '3.2.4'
  s.summary          = 'Clare iOS SDK V3.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://www.clare.ai'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Commercial', :file => 'LICENSE' }
  s.author           = { 'Clare' => 'hello@clare.ai' }
  s.source           = { :git => 'https://github.com/ClareAI/clare_ios_v3.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  #s.source_files = 'Clare/Classes/**/*'
  
  s.ios.vendored_frameworks = "Clare.framework"
  s.preserve_paths = 'Clare.framework/*'
  s.module_map = 'Clare.framework/Modules/module.modulemap'
  s.resource_bundles = {
    'Clare' => ['Clare/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.frameworks = 'UIKit', 'AVFoundation', 'CoreGraphics', 'Foundation', 'QuartzCore', 'SystemConfiguration', 'AssetsLibrary', 'CFNetwork', 'CoreTelephony', 'CoreText', 'Photos', 'Speech'
   s.libraries =  'c++', 'icucore'
   s.user_target_xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PODS_ROOT)/Clare', 'OTHER_LDFLAGS' => '-l"stdc++" -l"ObjC" -l"icucore" -l"c++" -framework "CoreGraphics" -framework "CoreText" -framework "CoreTelephony"  -framework "QuartzCore" -framework "SystemConfiguration" -framework "Photos" -framework "UIKit" -framework "AVFoundation" -framework "Foundation" -framework "AssetsLibrary" -framework "CFNetwork" -framework "Speech"'}

   s.dependency 'pop', '~> 1.0'
   s.dependency 'CMPopTipView'
   s.dependency 'SCSiriWaveformView'
   s.dependency 'DGActivityIndicatorView'
   s.dependency 'SocketRocket'
  
end
