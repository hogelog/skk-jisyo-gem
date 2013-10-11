# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skk/jisyo/version'

Gem::Specification.new do |spec|
  spec.name          = "skk-jisyo"
  spec.version       = Skk::Jisyo::VERSION
  spec.authors       = ["hogelog"]
  spec.email         = ["konbu.komuro@gmail.com"]
  spec.description   = %q{Install SKK-JISYO files}
  spec.summary       = %q{Install SKK-JISYO}
  spec.homepage      = "https://github.com/hogelog/skk-jisyo"
  spec.license       = "GPL3"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
