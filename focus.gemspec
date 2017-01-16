# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'focus/version'

Gem::Specification.new do |spec|
  spec.name          = 'focus'
  spec.version       = Focus::VERSION
  spec.authors       = ['Ilya Menshikov']
  spec.email         = ['unkmas@gmail.com']
  spec.summary       = %q{Gem to wrap SKB Kontur.Focus API}
  spec.description   = %q{Gem to wrap SKB Kontur.Focus API}
  spec.homepage      = 'https://github.com/unkmas/focus'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'json'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
