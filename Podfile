xcodeproj 'AromaSwiftClient/AromaSwiftClient.xcodeproj/'

# Uncomment this line to define a global platform for your project
platform :ios, '8.0'
# Uncomment this line if you're using Swift
use_frameworks!

#===============================
#MASTER REPO
source 'https://github.com/CocoaPods/Specs.git'
#===============================

#===============================
# REDROMA REPOSITORY
source 'https://github.com/RedRoma/CocoaSpecs.git'
#===============================

#===============================
# AROMA THRIFT
pod 'AromaThrift', '1.9'
#===============================

#===============================
# SWIFT EXCEPTION CATCHER
pod 'SwiftExceptionCatcher', '1.2'
#===============================

target 'AromaSwiftClient' do

end

target 'AromaSwiftClientTests' do

end

pre_install do |installer|


end

post_install do |installer|

    installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
        configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
    end

end
