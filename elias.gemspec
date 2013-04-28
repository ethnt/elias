# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "elias"
  spec.version       = "0.1.0"
  spec.authors       = ["Ethan Turkeltaub"]
  spec.email         = ["ethan.turkeltaub@gmail.com"]
  spec.description   = %q{Interact with the TouringPlans.com API.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/eturk/elias"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '~> 0.8.7'
  spec.add_dependency 'faraday_middleware', '~> 0.9.0'
  spec.add_dependency 'hashie'
end
