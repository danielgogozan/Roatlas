#
# Be sure to run `pod lib lint Roatlas.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Roatlas'
  s.version          = '0.1.5'
  s.summary          = 'This pod offers a component through which you can search and select the vast majority of localities in Romania.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/DanielGogozan/Roatlas'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Gogozan' => 'gogozandaniel@gmail.com' }
  s.source           = { :git => 'https://github.com/DanielGogozan/Roatlas.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'Roatlas/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Roatlas' => ['Roatlas/Assets/*.png']
  # }
  
   s.resource_bundles = {
     'Roatlas' => ['Roatlas/Classes/**/*.csv']
   }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'SwiftCSV'
end
