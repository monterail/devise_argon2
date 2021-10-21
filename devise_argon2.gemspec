# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "devise/encryptable/encryptors/argon2/version"

Gem::Specification.new do |gem|
  gem.name          = "devise_argon2"
  gem.homepage      = "https://github.com/monterail/devise_argon2"
  gem.version       = Devise::Encryptable::Encryptors::ARGON2_VERSION
  gem.summary       = ""
  gem.authors       = [""]

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'devise', '>= 2.1.0'
  gem.add_dependency 'devise-encryptable', '>= 0.2.0'
  gem.add_dependency 'argon2', '~> 2.1'
end
