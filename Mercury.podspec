
Pod::Spec.new do |spec|
  spec.name          = "Mercury"
  spec.version       = "0.0.1"
  spec.summary       = "This repository is a component library which can be reused."
  spec.homepage      = "https://github.com/codelynkslabs/Mercury"
  spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "Codelynks" => "info@codelynk.com" }
  spec.platform      = :ios, "15.0"
  spec.ios.deployment_target = '15.0'
  spec.source        = { :git => "https://github.com/codelynkslabs/Mercury.git", :tag => "0.0.1" }
  spec.source_files  = "Sources/Mercury/**/*.swift"
  spec.swift_version    = '5.3'
end
