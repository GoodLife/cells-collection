# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cells-collection/version'

Gem::Specification.new do |spec|
  spec.name          = "cells-collection"
  spec.version       = Cells::Collection::VERSION
  spec.authors       = ["GoodLife", "lulalala"]
  spec.email         = ["mark@goodlife.tw"]
  spec.description   = %q{Cells rendering for a collection of items, utilizing cache bulk-read.}
  spec.summary       = %q{Cells rendering for a collection of items}
  spec.homepage      = "https://github.com/GoodLife/cells-collection"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'cells', '~> 3.9'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec", "~> 2.14"
end
