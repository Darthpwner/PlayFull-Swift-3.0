source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'PlayFull Project Swift 3.0' do
    pod 'Alamofire', '~> 4.0'
end

target 'PlayFull Project Swift 3.0Tests' do

end

target 'PlayFull Project Swift 3.0UITests' do

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end