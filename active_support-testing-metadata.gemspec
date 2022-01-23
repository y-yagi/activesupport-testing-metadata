# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_support/testing/metadata/version'

Gem::Specification.new do |spec|
  spec.name          = "activesupport-testing-metadata"
  spec.version       = ActiveSupport::Testing::Metadata::VERSION
  spec.authors       = ["Yuji Yaginuma"]
  spec.email         = ["yuuji.yaginuma@gmail.com"]
  spec.summary       = %q{Metadata (key-value) support for ActiveSupport::TestCase}
  spec.homepage      = "https://github.com/y-yagi/activesupport-testing-metadata"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 4.0"
end
