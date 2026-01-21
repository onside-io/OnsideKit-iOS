Pod::Spec.new do |s|
  s.name                = 'OnsideKit'
  s.version             = '0.2.0'
  s.summary             = 'OnsideKit SDK'
  s.authors             = {"Aleksandr Goremykin"=>"sanllier@onside.io"}
  s.homepage            = 'https://https://github.com/onside-io/OnsideKit-iOS'
  s.description         = 'The OnsideKit SDK for integrating support of In-App purchases via Onside in your app'
  s.source              = { :http => 'https://github.com/onside-io/OnsideKit-iOS/releases/download/0.2.0/OnsideKit.xcframework.zip' }
  s.platform            = :ios, '16.0'
  s.preserve_paths      = 'OnsideKit.xcframework'
  s.vendored_frameworks = 'OnsideKit.xcframework'
end
