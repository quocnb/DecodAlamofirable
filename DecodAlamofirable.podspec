#
# Be sure to run `pod lib lint DecodAlamofirable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DecodAlamofirable'
  s.version          = '1.0.0'
  s.summary          = 'Alamofire + Decodable'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Help parse alamofire response to decodable object'

  s.homepage         = 'https://github.com/quocnb/DecodAlamofirable'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'quocnb' => 'quocnb.vnu@gmail.com' }
  s.source           = { :git => 'https://github.com/quocnb/DecodAlamofirable.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version    = '4.2'
  s.source_files = 'DecodAlamofirable/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DecodAlamofirable' => ['DecodAlamofirable/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire'
end
