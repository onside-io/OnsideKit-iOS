Pod::Spec.new do |s|
  s.name                = 'OnsideKitLite'
  s.version             = '1.1.0'
  s.summary             = 'OnsideKit SDK (Lite, without PassKit)'
  s.authors             = { 'Onside'=>'support@onside.io' }
  s.license             = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage            = 'https://github.com/onside-io/OnsideKit-iOS'
  s.description         = 'OnsideKit SDK without PassKit dependency, for apps that cannot include PassKit'
  s.source              = { :http => 'https://github.com/onside-io/OnsideKit-iOS/releases/download/1.1.0/OnsideKitLite.xcframework.zip' }
  s.platform            = :ios, '16.0'
  s.preserve_paths      = 'OnsideKitLite.xcframework', 'LICENSE'
  s.vendored_frameworks = 'OnsideKitLite.xcframework'
end
