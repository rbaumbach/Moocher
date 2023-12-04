Pod::Spec.new do |spec|
  spec.name                  = 'Moocher'
  spec.version               = '0.4.0'
  spec.summary               = 'A set of "rspec-like" test matchers that "mooch" off of XCTest'
  spec.homepage              = 'https://github.com/rbaumbach/Moocher'
  spec.license               = { :type => 'MIT', :file => 'MIT-LICENSE.txt' }
  spec.author                = { 'Ryan Baumbach' => 'github@ryan.codes' }
  spec.source                = { :git => 'https://github.com/rbaumbach/Moocher.git', :tag => spec.version.to_s }
  spec.requires_arc          = true
  spec.platform              = :ios
  spec.ios.deployment_target = '11.0'
  spec.framework             = 'XCTest'
  spec.swift_version         = '5.0'
  spec.default_subspec       = 'Core'

  spec.subspec 'Core' do |basic|
    basic.source_files       = 'Sources/Moocher/**/*.{swift}'
  end

  spec.subspec 'Polling' do |polling|
    polling.source_files     = 'Sources/MoocherPolling/**/*.{swift}'
  end
end
