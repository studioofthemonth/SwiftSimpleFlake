Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "SwiftSimpleFlake"
s.summary = "Flake IDs for Swift."
s.requires_arc = true
s.version = "0.1.0"
s.license = { :type => "MIT", :file => "LICENSE" }
s.author = { "Chase McClure" => "chase@setti.io" }
s.homepage = "https://github.com/studioofthemonth/SwiftSimpleFlake"
s.source = { :git => "https://github.com/studioofthemonth/SwiftSimpleFlake.git", :tag => "#{s.version}"}
s.framework = "Foundation"
s.source_files = "SwiftSimpleFlake/**/*.{swift}"
end
