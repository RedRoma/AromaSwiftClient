Pod::Spec.new do |aroma|
  aroma.name             = "AromaSwiftClient"
  aroma.module_name      = 'AromaSwiftClient'
  aroma.version          = "1.0"
  aroma.summary          = "The Official Aroma Swift Client."
  aroma.homepage         = "https://github.com/RedRoma/aroma-swift-client"
  aroma.license          = "Code is Licensed under Apache 2.0"
  aroma.author           = { "SirWellington" => "wellington@redroma.tech" }
  aroma.source           =
  {
       :path => "AromaSwiftClient/*"
  }
  aroma.source_files = "*.{h,m,swift}"
  # aroma.resources = 'Pod/Assets/*'

  aroma.platform     = :ios, '8.0', :osx, '10.8'
  aroma.requires_arc = false

  #===============================
  # REDROMA REPOSITORY
  source 'https://bitbucket.org/RedRoma/red-roma-cocoa-specs.git'
  #===============================
  
  aroma.dependency 'Thrift', '~> 0.9.3'
  aroma.dependency 'AromaThrift', '~> 1.8'
end
