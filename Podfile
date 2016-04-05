xcodeproj 'AromaSwiftClient/AromaSwiftClient.xcodeproj/'

# Uncomment this line to define a global platform for your project
platform :ios, '9.0'
# Uncomment this line if you're using Swift
use_frameworks!

#MASTER REPO
source 'https://github.com/CocoaPods/Specs.git'

#===============================
# REDROMA REPOSITORY
source 'https://bitbucket.org/RedRoma/red-roma-cocoa-specs.git'
#===============================

#===============================
# AROMA THRIFT
pod 'AromaThrift', :git => 'https://github.com/RedRoma/aroma-thrift.git', :branch => 'develop'
#===============================


target 'AromaSwiftClient' do

end

target 'AromaSwiftClientTests' do

end

pre_install do |installer|
    
    
end

post_install do |installer|
    
#    Unescaped command useful for the terminal
#    `find Pods -regex 'Pods/AromaThrift/.*\.h' -print0 | xargs -0 sed -i  '' 's_\(.*import\) "\(T.*h.*\)"_\1 <Thrift/\2>_'`
    `find Pods -regex '.*/*/AromaThrift/.*\.h' -print0 | xargs -0 sed -i  '' 's_\\(.*import\\) \\"\\(T.*h.*\\)\\"_\\1 <Thrift/\\2>_'`

    installer.pods_project.build_configuration_list.build_configurations.each do |configuration|
        configuration.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
    end

end
