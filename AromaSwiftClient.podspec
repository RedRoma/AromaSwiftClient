Pod::Spec.new do |aroma|
  aroma.name             = "AromaSwiftClient"
  aroma.module_name      = 'AromaSwiftClient'
  aroma.version          = "1.3"
  aroma.summary          = "The Official Aroma Swift Client."
  aroma.homepage         = "https://github.com/RedRoma/aroma-swift-client"
  aroma.license          = "Code is Licensed under Apache 2.0"
  aroma.author           = { "SirWellington" => "wellington@redroma.tech" }
  aroma.source           =
  {
       :path => "AromaSwiftClient/AromaSwiftClient/"
  }
  aroma.source_files = "AromaSwiftClient/AromaSwiftClient/*.{h,m,swift}"
  # aroma.resources = 'Pod/Assets/*'

  aroma.platform     = :ios, '8.0', :osx, '10.8'
  aroma.requires_arc = false

  # aroma.dependency 'ThriftLib', '0.9.3'
  aroma.dependency 'AromaThrift', '1.10'
  aroma.dependency 'SwiftExceptionCatcher', '1.1'

  # aroma.prepare_command = <<-CMD
  #
  #       find Pods -regex '.*/*/AromaThrift/.*\\.h' -print0 | xargs -0 sed -i  '' 's_.*import.*\\"TProtocol.h\\"_@import ThriftLib;_'
  #       find Pods -regex '.*/*/AromaThrift/.*\\.h' -print0 | xargs -0 sed -i  '' 's_.*import.*T.h\\"__'
  #   CMD
end
