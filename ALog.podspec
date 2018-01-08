#
# Be sure to run `pod lib lint ALog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ALog'
  s.version          = '0.1.0'
  s.summary          = 'Abyss`s Log'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  # Abyss`s Log

  - [x]支持emoji
  - [x]支持原生类型输出utf8
  - [x]debug下运行, 性能第一
                       DESC

  s.homepage         = 'https://github.com/RogerAbyss/ALog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'abyss' => 'roger_ren@qq.com' }
  s.source           = { :git => 'git@github.com:RogerAbyss/ALog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ALog/Classes/**/*'
  s.public_header_files = 'ALog/Classes/**/*.h'
  
  # s.resource_bundles = {
  #   'ALog' => ['ALog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
