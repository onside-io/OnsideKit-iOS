Pod::Spec.new do |s|
  s.name                = 'OnsideKit'
  s.version             = '0.7.2'
  s.summary             = 'OnsideKit SDK'
  s.authors             = { "Onside"=>"support@onside.io" }
  s.license             = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage            = 'https://github.com/onside-io/OnsideKit-iOS'
  s.description         = 'The OnsideKit SDK for integrating support of In-App purchases via Onside in your app'
  s.source              = { :http => 'https://github.com/onside-io/OnsideKit-iOS/releases/download/0.7.2/OnsideKit.xcframework.zip' }
  s.platform            = :ios, '16.0'
  s.preserve_paths      = 'OnsideKit.xcframework'
  s.vendored_frameworks = 'OnsideKit.xcframework'
end
